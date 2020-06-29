<?php
namespace App\Model;

use Base\Db;

class Message
{
    private $id;
    private $text;
    private $date;
    private $user_id;
    /** @var User */
    private $author;
    private $image;

    public function __construct(array $data)
    {
        $this->text = $data['text'];
        $this->date = $data['date'];
        $this->user_id = $data['user_id'];
        $this->image = $data['image'] ?? '';
    }

    public static function deleteMessage(int $messageId)
    {
        $db = Db::getInstance();
        $query = "DELETE FROM messages WHERE id = $messageId";
        return $db->exec($query, __METHOD__);
    }

    public function save()
    {
        $db = Db::getInstance();
        $res = $db->exec(
            'INSERT INTO messages (
                    text, 
                    date,
                    user_id,
                    image
                    ) VALUES (
                    :text, 
                    :date,
                    :user_id,
                    :image
                )',
            __FILE__,
            [
                ':text' => $this->text,
                ':date' => $this->date,
                ':user_id' => $this->user_id,
                ':image' => $this->image,
            ]
        );

        return $res;
    }


    public static function getList(int $limit = 20, int $offset = 0): array
    {
        $db = Db::getInstance();
        $data = $db->fetchAll(
            "SELECT * fROM messages LIMIT $limit OFFSET $offset",
            __METHOD__
        );
        if (!$data) {
            return [];
        }

        $messages = [];
        foreach ($data as $elem) {
            $message = new self($elem);
            $message->id = $elem['id'];
            $messages[] = $message;
        }

        return $messages;
    }

    public static function getUserMessages(int $userId, int $limit): array
    {
        $db = Db::getInstance();
        $data = $db->fetchAll(
            "SELECT * fROM messages WHERE user_id = $userId LIMIT $limit",
            __METHOD__
        );
        if (!$data) {
            return [];
        }

        $messages = [];
        foreach ($data as $elem) {
            $message = new self($elem);
            $message->id = $elem['id'];
            $messages[] = $message;
        }

        return $messages;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getText(): string
    {
        return $this->text;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->date;
    }

    /**
     * @return mixed
     */
    public function getAuthorId()
    {
        return $this->user_id;
    }

    /**
     * @return User
     */
    public function getAuthor(): User
    {
        return $this->author;
    }

    /**
     * @param User $author
     */
    public function setAuthor(User $author): void
    {
        $this->author = $author;
    }

    public function loadFile(string $file)
    {
        if (file_exists($file)) {
            $this->image = $this->genFileName();
            move_uploaded_file($file,getcwd() . '/images/' . $this->image);
        }
    }

    private function genFileName()
    {
        return sha1(microtime(1) . mt_rand(1, 100000000)) . '.jpg';
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }

    public function getData()
    {
        return [
            'id' => $this->id,
            'user_id' => $this->user_id,
            'text' => $this->text,
            'date' => $this->date,
            'image' => $this->image
        ];
    }
}