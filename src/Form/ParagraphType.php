<?php

namespace App\Form;

use App\Entity\Post;
use App\Entity\Paragraph;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;

class ParagraphType extends AbstractType
{
    public function __construct(private RequestStack $req,
    private EntityManagerInterface $em, 
    ) {
    }

    public function buildForm(FormBuilderInterface $builder, array $options): void

    {
        $session = $this->req->getSession(); 
        $em = $this->em ;
        $createdPostId = $session->get('createdPostId') ;
        $lastParagraphOrder =  $session->get('createdParagraphOrder') ?? null;

        $builder
            ->add('content')
            ->add('order_number', IntegerType::class, [
                'required' => false,
                'data' => $lastParagraphOrder+1,
                
            ])
            ->add('type', ChoiceType::class, [
                'choices'  => [
                    'paragraphe' => 'paragraphe',
                    'code' => 'code',
                    'intro' => 'intro',
                ],
            ])
            ->add('post', EntityType::class, [
                'class' => Post::class,
                'choice_label' => 'id',
                'data'=>$em->getRepository(Post::class)->find($createdPostId)
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Paragraph::class,
        ]);
    }
}
