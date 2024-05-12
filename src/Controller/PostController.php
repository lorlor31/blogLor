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

#[Route('/post', name: 'app_post_')]
class PostController extends AbstractController
{
    #[Route('/list', name: 'list')]
    public function list(PostRepository $postRepos): Response
    {
        $posts=$postRepos->findAll();
        return $this->render('post/list.html.twig', [
            'posts'=>$posts
        ]);
    }

    // #[Route('/{id<\d+>}', name: 'show')]
    // public function gallery(): Response
    // {
    //     return $this->render('post/post.html.twig', [
    //     ]);
    // }

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
        $post = new Post() ;
        $formPost = $this->createForm(PostType::class, $post); 
        $formPost->handleRequest($request);
    
        if ($formPost->isSubmitted() && $formPost->isValid()) {
            $em->persist($post);
            $em->flush();
            if ($post->getId()!= $session->get('createdPostId')){
                $session->set('createdParagraphOrder', null);
            }
            $session->set('createdPostId', $post->getId());
            $this->addFlash(
                'success', 
                "L'article " . $post->getId()  . " a été créé avec succès"
            );
            return $this->redirectToRoute('app_paragraph_create', [], Response::HTTP_SEE_OTHER);
        }

    

        return $this->render('post/create.html.twig', [
            // 'post' => $post,
            'formPost' => $formPost,
        ]);
    }


}
