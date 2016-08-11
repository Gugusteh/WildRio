<?php

namespace VoteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Votes
 *
 * @ORM\Table(name="votes")
 * @ORM\Entity(repositoryClass="VoteBundle\Repository\VotesRepository")
 */
class Votes
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
     * @ORM\Column(name="iduser", type="integer", nullable=true)
     */
    private $iduser;

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
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set iduser
     *
     * @param integer $iduser
     * @return Votes
     */
    public function setIduser($iduser)
    {
        $this->iduser = $iduser;

        return $this;
    }

    /**
     * Get iduser
     *
     * @return integer 
     */
    public function getIduser()
    {
        return $this->iduser;
    }

    /**
     * Set idepreuve
     *
     * @param integer $idepreuve
     * @return Votes
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
     * @return Votes
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
}
