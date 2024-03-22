<?php

namespace App\Controller;

use App\Entity\Post;
use App\Repository\PostRepository;
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

    #[Route('/{id<\d+>}', name: 'show_post')]
    public function showPost(Post $post): Response
    {
        return $this->render('post/post.html.twig', [
            'post'=>$post
        ]);
    }
    // TODO Pour le show d un article, faire une requete qui recupere ts les paragr et les code et les range par ordre croissant 
    // puis les afficher et faire une condition pour choisir la class Tailwind à appliquer 
}
