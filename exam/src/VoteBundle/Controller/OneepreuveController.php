<?php

namespace VoteBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use VoteBundle\Entity\Epreuve;
use VoteBundle\Entity\Votes;
use VoteBundle\Entity\CountVotes;
use Symfony\Component\HttpFoundation\RedirectResponse;

class OneepreuveController extends Controller
{
	public function showAction($id)
	{
		$counting = 0;
		$em=$this->getDoctrine()->getManager();
		$user=$this->getUser();
		$epreuve = $em->getRepository('VoteBundle:Epreuve')->findOneById($id);
		$athletes=$em->getRepository('VoteBundle:Athlete')->findByEpreuve($epreuve);
		$vote = $em->getRepository('VoteBundle:Votes')->findOneBy(array(
			'iduser'=>$user->getId(),
			'idepreuve'=>$epreuve->getId(),
			));
		if(empty($vote))
		{
			$vote = null;
		}
		
		$votes=$em->getRepository('VoteBundle:CountVotes')->findBy(
			array('idepreuve'=>$id),
			array('votes'=>'desc'),
			3
			);
		$totalvotes=count($em->getRepository('VoteBundle:Votes')->findByIdepreuve($id));
		if(empty($votes))
		{
			$topvotes=null;
		}
		else
		{
			foreach ($votes as $onevote)
			{
				$athname=$em->getRepository('VoteBundle:Athlete')->findOneById($onevote->getIdathlete())->getName();
				$topvotes[]=array(
					'name'=>$athname,
					'percent'=>((($onevote->getVotes())/$totalvotes) * 100),
					);
				$counting ++;
			}
		}
		return $this->render('VoteBundle:Default:epreuve.html.twig',array(
			'user'=>$user,
			'epreuve'=>$epreuve,
			'athletes'=>$athletes,
			'vote'=>$vote,
			'counting'=>$counting,
			'votes'=>$topvotes
			));
	}
	public function voteAction(Request $request, $id)
	{
		$em=$this->getDoctrine()->getManager();
		$user=$this->getUser();
		$vote = new Votes();
		$vote->setIduser($user->getId());
		$vote->setIdepreuve($id);
		$vote->setIdathlete($request->request->get('idathlete'));

		$em->persist($vote);
		$em->flush();

		$countvote=$em->getRepository('VoteBundle:CountVotes')->findOneBy(array(
			'idepreuve'=>$id,
			'idathlete'=>$request->request->get('idathlete'),
			));
		if(empty($countvote))
		{
			$countvote = new CountVotes();
			$countvote->setIdathlete($request->request->get('idathlete'));
			$countvote->setIdepreuve($id);
			$countvote->setVotes(1);
		}
		else
		{
			$countvote->setVotes($countvote->getVotes()+1);
		}
		$em->persist($countvote);
		$em->flush();

		$url = $this -> generateUrl('epreuve', array('id'=>$id));
        $response = new RedirectResponse($url);
        return $response;
	}
}