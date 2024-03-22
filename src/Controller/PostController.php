<?php

namespace App\Controller;

use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

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

    #[Route('/{id<\d+>}', name: 'show')]
    public function gallery(): Response
    {
        return $this->render('post/post.html.twig', [
        ]);
    }

    // TODO Pour le show d un article, faire une requete qui recupere ts les paragr et les code et les range par ordre croissant 
    // puis les afficher et faire une condition pour choisir la class Tailwind à appliquer 
}
