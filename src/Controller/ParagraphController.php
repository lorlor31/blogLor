<?php

namespace App\Controller;

use App\Entity\Paragraph;
use App\Entity\Post;
use App\Form\PostType;
use App\Form\ParagraphType;
use App\Repository\PostRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/paragraph', name: 'app_paragraph_')]
class ParagraphController extends AbstractController
{
    #[Route('/{id<\d+>}', name: 'show')]
    public function showPost(Post $post): Response
    {
        return $this->render('post/post.html.twig', [
            'post'=>$post
        ]);
    }
    // TODO Pour le show d un article, faire une requete qui recupere ts les paragr et les code et les range par ordre croissant 
    // puis les afficher et faire une condition pour choisir la class Tailwind à appliquer 


    #[Route('/create', name: 'create', methods:['GET','POST'])]
    public function create(EntityManagerInterface $em, Request $request): Response
    {
        $session = $request->getSession(); 
        $paragraph = new Paragraph() ;
        $formParag = $this->createForm(ParagraphType::class, $paragraph); 
        $formParag->handleRequest($request);
        
        
        if ($formParag->isSubmitted() && $formParag->isValid()) {
            $postId=$paragraph->getPost()->getId();
            $session->set('createdParagraphOrder', $paragraph->getOrderNumber());
            $em->persist($paragraph);
            $em->flush();
            return $this->redirectToRoute('app_post_show', ['id' => $postId], Response::HTTP_SEE_OTHER);
        }

        return $this->render('paragraph/create.html.twig', [
            // 'post' => $post,
            'formParag' => $formParag,

        ]);
    }


}
