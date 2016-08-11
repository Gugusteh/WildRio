<?php

namespace VoteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CountVotes
 *
 * @ORM\Table(name="count_votes")
 * @ORM\Entity(repositoryClass="VoteBundle\Repository\CountVotesRepository")
 */
class CountVotes
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var int
     *
     * @ORM\Column(name="idepreuve", type="integer", nullable=true)
     */
    private $idepreuve;

    /**
     * @var int
     *
     * @ORM\Column(name="idathlete", type="integer", nullable=true)
     */
    private $idathlete;

    /**
     * @var int
     *
     * @ORM\Column(name="votes", type="integer", nullable=true)
     */
    private $votes;


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
     * Set idepreuve
     *
     * @param integer $idepreuve
     * @return CountVotes
     */
    public function setIdepreuve($idepreuve)
    {
        $this->idepreuve = $idepreuve;

        return $this;
    }

    /**
     * Get idepreuve
     *
     * @return integer 
     */
    public function getIdepreuve()
    {
        return $this->idepreuve;
    }

    /**
     * Set idathlete
     *
     * @param integer $idathlete
     * @return CountVotes
     */
    public function setIdathlete($idathlete)
    {
        $this->idathlete = $idathlete;

        return $this;
    }

    /**
     * Get idathlete
     *
     * @return integer 
     */
    public function getIdathlete()
    {
        return $this->idathlete;
    }

    /**
     * Set votes
     *
     * @param integer $votes
     * @return CountVotes
     */
    public function setVotes($votes)
    {
        $this->votes = $votes;

        return $this;
    }

    /**
     * Get votes
     *
     * @return integer 
     */
    public function getVotes()
    {
        return $this->votes;
    }
}
