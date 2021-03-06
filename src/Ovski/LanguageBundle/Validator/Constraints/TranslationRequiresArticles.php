<?php

namespace Ovski\LanguageBundle\Validator\Constraints;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 */
class TranslationRequiresArticles extends Constraint
{
    public $message = "%language%.article.missing";

    public function validatedBy()
    {
        return 'translation_requires_articles_validator';
    }

    public function getTargets()
    {
        return self::CLASS_CONSTRAINT;
    }
}