<?php

namespace App\Form;

use App\Entity\Procedure;
use App\Entity\Recipes;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;

class RecipesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('name', TextType::class, ["attr"=>["placeholder"=>"please type the recipe name", "class"=>"form-control mb-2"]])
            ->add('Category', TextType::class, ["attr"=>["placeholder"=>"Vegan, Vegetarian, Universal, etc...", "class"=>"form-control mb-2"]])
            ->add('Servings', NumberType::class, ["attr"=>["placeholder"=>"for how many people", "class"=>"form-control mb-2"]])
            ->add('Price',  NumberType::class, ["attr"=>["placeholder"=>"The max price of the ingrediants", "class"=>"form-control mb-2"]])
            ->add('Time' , TextType::class, ["attr"=>["placeholder"=>"how long will it take", "class"=>"form-control mb-2"]])
            
                ->add('picture', FileType::class, [
                    'label' => 'Picture',
    
                    'mapped' => false,
    
                    
                    'required' => false,
    
                   
                    'constraints' => [
                        new File([
                            'maxSize' => '2048k',
                            'mimeTypes' => [
                                'image/png',
                                'image/jpg',
                                'image/jpeg',
                            ],
                            'mimeTypesMessage' => 'Please upload a valid picture document',
                        ])
                    ],
                ])
                ->add('Create', SubmitType::class, ["attr"=>[ "class"=>"btn btn-primary"]])
            
        
    
    
       
            
            
            
            
            
            
                ->add('fkProcedure', EntityType::class, [
                    "class" => Procedure::class,
                    "choice_label" => "instructions"
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Recipes::class,
        ]);
    }
}
