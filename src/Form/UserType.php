<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', TextType::class, ["attr" => ["placeholder" => "email", "class" => "form-control mb-2"]])
        
            ->add('password', PasswordType::class, ["attr" => ["placeholder" => "password", "class" => "form-control mb-2"]])
            ->add('name', TextType::class, ["attr" => ["placeholder" => "full name", "class" => "form-control mb-2"]])
            ->add(
                'gender',
                ChoiceType::class,
                [
                    'choices' => [
                        'female' => "female",
                        'male' => "male",
                        'none' => "none"
                    ], "attr" => ["class" => "form-control"]
                ]
            )
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
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
