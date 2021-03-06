<?php

namespace Ovski\LanguageBundle\Validator\Constraints;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class TranslationUniqueValidator extends ConstraintValidator
{
    private $em;
    private $tokenStorage;

    /**
     * Constructor
     *
     * @param EntityManager $em
     * @param TokenStorageInterface $tokenStorage
     */
    public function __construct(EntityManager $em, TokenStorageInterface $tokenStorage)
    {
        $this->em = $em;
        $this->tokenStorage = $tokenStorage;
    }

    public function validate($translation, Constraint $constraint)
    {
        if ($translation->getWordType() != null) {
            $nameArticle = $this->em->getRepository('OvskiLanguageBundle:WordType')->getDefaultWordTypeValueById(
                $translation->getWordType()->getId()
            );
        } else {
            $nameArticle = null;
        }

        // if the first word does not exist, the translation will be unique

        if ($nameArticle == 'name') {
            $article1 = $this->em->getRepository('OvskiLanguageBundle:Article')->findBy(
                array(
                    'language' => $translation->getLearning()->getLanguage1(),
                    'value'    => $translation->getWord1()->getArticle()->getValue()
                )
            );
        } else {
            $article1 = null;
        }
        $word1 = $this->em->getRepository('OvskiLanguageBundle:Word')->findBy(
            array(
                'article'  => $article1,
                'wordType' => $translation->getWordType(),
                'value'    => $translation->getWord1()->getValue()
            )
        );
        if (!$word1) {
            return;
        }

        // if the second word does not exist, the translation will be unique
        if ($nameArticle == 'name') {
            $article2 = $this->em->getRepository('OvskiLanguageBundle:Article')->findBy(
                array(
                    'language' => $translation->getLearning()->getLanguage2(),
                    'value'    => $translation->getWord2()->getArticle()->getValue(),
                )
            );
        } else {
            $article2 = null;
        }
        $word2 = $this->em->getRepository('OvskiLanguageBundle:Word')->findBy(
            array(
                'article'  => $article2,
                'wordType' => $translation->getWordType(),
                'value'    => $translation->getWord2()->getValue()
            )
        );
        if (!$word2) {
            return;
        }

        $translations = $this->em->getRepository('OvskiLanguageBundle:Translation')->findBy(
            array(
                'word1'    => $word1,
                'word2'    => $word2,
                'wordType' => $translation->getWordType(),
                'learning' => $translation->getLearning(),
                'user'     => $this->tokenStorage->getToken()->getUser()
            )
        );

        if (!empty($translations))
        {
            $this->context->addViolationAt(
                null,
                $constraint->message,
                array(),
                null
            );
        }
    }
}