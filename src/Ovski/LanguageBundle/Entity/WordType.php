<?php

namespace Ovski\LanguageBundle\Entity;

use Gedmo\Translatable\Translatable;
use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;

/**
 * WordType
 *
 * @ORM\Table(name="ovski_word_type")
 * @ORM\Entity(repositoryClass="Ovski\LanguageBundle\Repository\WordTypeRepository")
 */
class WordType
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @Gedmo\Translatable
     * @ORM\Column(name="value", type="string", length=255)
     */
    private $value;

    /**
     * @Gedmo\Locale
     *
     * Used locale to override Translation listener`s locale
     * this is not a mapped field of entity metadata, just a simple property
     */
    private $locale;

    /**
     * WordType to string
     *
     * @return string
     */
    public function __toString()
    {
        return $this->value;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set value
     *
     * @param string $value
     * @return Word
     */
    public function setValue($value)
    {
        $this->value = $value;

        return $this;
    }

    /**
     * Get value
     *
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    public function setTranslatableLocale($locale)
    {
        $this->locale = $locale;
    }
}
