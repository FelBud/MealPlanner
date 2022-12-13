<?php

namespace App\Form;

use App\Entity\Procedure;
use App\Entity\Recipes;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
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
        ->add('name', TextType::class, ["attr"=>["placeholder"=>"please type the recipe name", "class"=>"form-control mb-2", "style" => "width: 700px"]])
            ->add('Category', ChoiceType::class, [
                'choices' => [
                    'universal' => "Universal",
                    'vegan' => "Vegan",
                    'vegetarian' => "Vegetarian"],
                
                
                
                "attr"=>["class"=>"form-control mb-2"]])
            ->add('Servings', IntegerType::class, ["attr"=>["placeholder"=>"for how many people", "class"=>"form-control mb-2"]])
            ->add('Price',  IntegerType::class, ["attr"=>["placeholder"=>"The approximately price of the ingredients", "class"=>"form-control mb-2"]])
            ->add('Time' , IntegerType::class, ["attr"=>["placeholder"=>"preparation time in minutes", "class"=>"form-control mb-2"]])
            ->add('procedure', TextareaType::class,["mapped"=>false,"attr"=>["placeholder"=>"preparation", "class"=>"form-control mb-2"]])
            
                ->add('picture', FileType::class, [
                    "attr"=>array("class"=>"form-control mb-2"),
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
                ->add('procedure', TextareaType::class,["mapped"=>false,"attr"=>["placeholder"=>"preparation", "class"=>"form-control mb-2"]])
                ->add('Create', SubmitType::class, ["attr"=>[ "class"=>"btn btn-outline-dark btnsize"]])

                
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Recipes::class,
        ]);
    }
}
