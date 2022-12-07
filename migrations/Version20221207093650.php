<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221207093650 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE weekplanner ADD fk_user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE weekplanner ADD CONSTRAINT FK_1818E9B15741EEB9 FOREIGN KEY (fk_user_id) REFERENCES user (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1818E9B15741EEB9 ON weekplanner (fk_user_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE weekplanner DROP FOREIGN KEY FK_1818E9B15741EEB9');
        $this->addSql('DROP INDEX UNIQ_1818E9B15741EEB9 ON weekplanner');
        $this->addSql('ALTER TABLE weekplanner DROP fk_user_id');
    }
}
