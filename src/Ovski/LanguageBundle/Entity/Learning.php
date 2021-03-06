<?php

namespace Ovski\LanguageBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Ovski\ToolsBundle\Tools\Utils;
use Ovski\LanguageBundle\Validator\Constraints as OvskiAssert;

/**
 * Learning
 *
 * @ORM\Table(name="ovski_learning", uniqueConstraints={
 *     @ORM\UniqueConstraint(
 *         name="unique_learning_idx",
 *         columns={"language1_id", "language2_id"}
 *     )
 * })
 * @ORM\Entity(repositoryClass="Ovski\LanguageBundle\Repository\LearningRepository")
 * @ORM\HasLifecycleCallbacks
 * @OvskiAssert\LearningUnique
 * @OvskiAssert\LearningLanguagesNotIdentical
 */
class Learning
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var Language
     *
     * @ORM\ManyToOne(targetEntity="Ovski\LanguageBundle\Entity\Language")
     * @ORM\JoinColumn(nullable=false)
     */
    protected $language1;

    /**
     * @var Language
     *
     * @ORM\ManyToOne(targetEntity="Ovski\LanguageBundle\Entity\Language")
     * @ORM\JoinColumn(nullable=false)
     */
    protected $language2;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    protected $slug;

    /**
     * @ORM\ManyToMany(targetEntity="Ovski\UserBundle\Entity\User", inversedBy="learnings", cascade={"persist"})
     * @ORM\JoinTable(name="ovski_user_learning")
     */
    protected $users;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->users = new ArrayCollection();
    }

    /**
     * Set slug
     *
     * @ORM\PreUpdate
     * @ORM\PrePersist
     */
    public function setSlug()
    {
        $array = array($this->getLanguage1()->getName(), $this->getLanguage2()->getName());
        sort($array);
        $this->slug = Utils::slugify($array[0].' - '.$array[1]);
    }

    /**
     * Learning to string
     *
     * @return string
     */
    public function __toString()
    {
        $array = array($this->getLanguage1()->getName(), $this->getLanguage2()->getName());
        sort($array);
        return ucfirst($array[0]).' - '.ucfirst($array[1]);
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
     * Set language1
     *
     * @param \Ovski\LanguageBundle\Entity\Language $language1
     * @return Learning
     */
    public function setLanguage1(\Ovski\LanguageBundle\Entity\Language $language1)
    {
        $this->language1 = $language1;

        return $this;
    }

    /**
     * Get language1
     *
     * @return \Ovski\LanguageBundle\Entity\Language 
     */
    public function getLanguage1()
    {
        return $this->language1;
    }

    /**
     * Set language2
     *
     * @param \Ovski\LanguageBundle\Entity\Language $language2
     * @return Learning
     */
    public function setLanguage2(\Ovski\LanguageBundle\Entity\Language $language2)
    {
        $this->language2 = $language2;

        return $this;
    }

    /**
     * Get language2
     *
     * @return \Ovski\LanguageBundle\Entity\Language 
     */
    public function getLanguage2()
    {
        return $this->language2;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Add user
     *
     * @param \Ovski\UserBundle\Entity\User $user
     * @return Learning
     */
    public function addUser(\Ovski\UserBundle\Entity\User $user)
    {
        $this->users[] = $user;

        return $this;
    }

    /**
     * Remove user
     *
     * @param \Ovski\UserBundle\Entity\User $user
     */
    public function removeUser(\Ovski\UserBundle\Entity\User $user)
    {
        $this->users->removeElement($user);
    }

    /**
     * Get users
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsers()
    {
        return $this->users;
    }
}
