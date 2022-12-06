<?php
namespace App\DataFixtures;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\User;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
 
public function __construct(UserPasswordHasherInterface $hasher)
  {
      $this->hasher = $hasher;
  }

  public function load(ObjectManager $manager)
  {
      $user = new User();
      $user->setName("serri");
      $user->setGender("none");
    //   $user->setStatus('["ROLE_USER"]');
      $user->setEmail("user@mail.com");
      $password = $this->hasher->hashPassword($user, '123123');
      $user->setPassword($password);

      $manager->persist($user);
      $manager->flush();
  }
}