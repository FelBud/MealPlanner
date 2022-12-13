<?php

namespace App\Form;

use App\Entity\Weekplanner;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class WeekplannerType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // ->add('date')
            ->add('weekday', ChoiceType::class, [
                'choices' => [
                    'Mon.' => "Mon",
                    'Tue.' => "Tue.",
                    'Wed.' => "Wed.",
                    'Thu.' => "Thu.",
                    'Fri.' => "Fri.",
                    'Sat.' => "Sat.",
                    'Sun.' => "Sun."],
                "attr"=>["class"=>"form-control mb-2"]])
                
            ->add('mealTime', ChoiceType::class, [
                'choices' => [
                    'Breakfast' => "Breakfast",
                    'Lunch' => "Lunch",
                    'Dinner' => "Dinner"],
                "attr"=>["class"=>"form-control mb-2"]])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Weekplanner::class,
        ]);
    }
}
