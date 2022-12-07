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

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', TextType::class, ["attr" => ["placeholder" => "email", "class" => "form-control mb-2"]])
            ->add(
                'roles',
                ChoiceType::class,
                [
                    'choices' => [
                        'ROLE_USER' => "ROLE_USER",
                        'ROLE_ADMIN' => "ROLE_ADMIN",
                    ], "attr" => ["class" => "form-controll", "style" => "width: 200px"]
                ]
            )
            ->add('password', PasswordType::class, ["attr" => ["placeholder" => "password", "class" => "form-control mb-2"]])
            ->add('name', TextType::class, ["attr" => ["placeholder" => "full name", "class" => "form-control mb-2"]])
            ->add(
                'gender',
                ChoiceType::class,
                [
                    'choices' => [
                        'female' => "female",
                        'make' => "male",
                        'none' => "none"
                    ], "attr" => ["class" => "form-controll", "style" => "width: 200px"]
                ]
            )
            ->add('picture', TextType::class, ["attr" => ["placeholder" => "url", "class" => "form-control mb-2"]]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
