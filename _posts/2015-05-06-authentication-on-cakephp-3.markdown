---
layout: post
title:  "احراز هویت کاربران در CakePHP 3.0"
date:   2015-05-06 11:00:00
fa-date: چهارشنبه ١۶ اردیبهشت ١٣٩۴
categories: tutorial
published: true
tags: آموزش کنترل-دسترسی احراز-هویت authentication cakephp php tutorial
---

<div class="container centeralized">
	<img src="../img/cakephp-authentication.jpg" width="471" alt="cakephp authentication">
</div>
کنترل دسترسی کاربران یکی از مهمترین مسائلی است که در طراحی هر برنامه ای لحاظ می شود. علاوه بر احراز هویت (authentication)، کنترل دسترسی کاربران (authorization) نیز مهم است.

برای ایجاد مکانیزم احراز هویت به یک جدول در database نیاز است تا اطلاعات کاربران در آن ذخیره شود. در این مثال از جدول users استفاده شده است.

این جدول را طبق کد SQL زیر ایجاد می کنیم.
{% highlight sql %}
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` int(10) unsigned NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'ROLE_USER',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
{% endhighlight %}

- برای کاربران دو نقش (role) در نظر گرفته شده است. نقش USER و نقش ADMIN. که کاربر ثبت نامی به صورت پیش فرض USER می باشد.

- رمز عبور قبل از ذخیره در پایگاه داده، hash می شود.

- برای احراز هویت از username و password استفاده می شود. شما به سادگی می توانید این مکانیزم را به email یا هر فیلد دیگری تغییر دهید.

برای استفاده از این جدول نیاز به Controller ها، Entity ها، view ها , ... داریم که می توان به سادگی با استفاده از کنسول cakephp تمامی این موارد را ساخت. برای استفاده از کنسول در مسیر پوشه <span class="inline-code">bin</span> کد زیر را وارد می کنیم:

{% highlight text %}
cake bake all users
{% endhighlight %}

با به کار بردن کلمه کلیدی all به این دستور می گوییم که تمامی اجزا مربوط به users را بساز. می توان تک تک اجزا را جداگانه ساخت.

بکار بردن رمز عبور به صورت متن قابل فهم و ذخیره آن از نظر امنیتی بسیار خطرناک است. بهتر است password قبل از ذخیره در database به صورت کامل hash شود. برای این کار کد زیر را در Entity مربوط به User وارد می کنیم.

{% highlight php %}
namespace App\Model\Entity;

use Cake\Auth\DefaultPasswordHasher;
use Cake\ORM\Entity;

class User extends Entity
{

	//....

    protected function _setPassword($password)
    {
        return (new DefaultPasswordHasher)->hash($password);
    }
}
{% endhighlight %}

حال برای داشتن یک کاربر اولیه می توانیم به آدرس <span class="inline-code">users/add</span> رفته و یک کاربر پیش فرض با دسترسی ROLE_ADMIN ایجاد کنیم. ایجاد این کاربر الزامی است. چون بعد از راه اندازی authentication دیگر توانایی ثبت کاربر وجود نخواهد داشت.

سپس می بایست تنظیمات مربوط به authentication را در فایل <span class="inline-code">AppController.php</span> انجام دهیم. قطعه کد زیر را در تابع initialize این controller می نویسیم:

{% highlight php %}
$this->loadComponent('Auth',[
    'authorize' => ['Controller'],
    'loginAction' => [
        'controller' => 'Users',
        'action' => 'login'
    ],
    'authError' => 'شما اجازه دسترسی به این ناحیه را ندارید',
    'logoutRedirect' => [
        'controller' => 'Pages',
        'action' => 'display'
    ]
]);
{% endhighlight %}

همانطور که از تنظیمات مشخص است برای ورود از اکشن login در کنترلر Users استفاده می کنیم. اکشن login را در <span class="inline-code">UsersController.php</span> به صورت زیر می نویسیم:

{% highlight php %}
public function login()
{
    if($this->request->is('post')){
        $user = $this->Auth->identify();
        if($user){
            $this->Auth->setUser($user);
            return $this->redirect($this->Auth->redirectUrl());
        } else {
            $this->Flash->error(
                'نام کاربری یا رمز عبور اشتباه می باشد',
                'default',
                [],
                'auth'
                );
        }
    }
}
{% endhighlight %}

سپس نوبت به ایجاد view برای login می رسد. در مسیر <span class="inline-code">src\Template\Users</span> یک فایل با نام <span class="inline-code">login.ctp</span> ایجاد می کنیم:

{% highlight html %}
<!-- File: src/Template/Users/login.ctp -->

<div class="flash"><?= $this->Flash->render('auth') ?></div>
	<div class="row">
	<?= $this->Form->create() ?>
	    <fieldset>
	        <legend>لطفا نام کاربری و رمز عبور خود را وارد نمایید.</legend>
	        <?= $this->Form->input('username', ['label' => 'نام کاربری', 'class' => 'form-input']) ?>
	        <?= $this->Form->input('password', ['label' => 'رمز عبور', 'class' => 'form-input']) ?>
	    </fieldset>
	    <br>
	<?= $this->Form->button('ورود', ['class' => 'btn']); ?>
	<?= $this->Form->end() ?>
	</div>
</div>
{% endhighlight %}

در نهایت هم برای logout یک اکشن در Users می نویسیم:

{% highlight php %}
public function logout()
{
    return $this->redirect($this->Auth->logout());
}
{% endhighlight %}

# نکته
مطمئناً ما برای تمامی صفحات نیاز به ورود کاربران نداریم. برای اینکه مشخص کنیم چه صفحاتی نیاز به authentication ندارند طبق مثال زیر عمل می کنیم. در تابع beforeFilter هر کنترلر می توان این موضوع را مشخص کرد. برای مثال می خواهیم اکشن display مربوط به کنترلر Pages نیازی به authentication نداشته باشد:

{% highlight php %}
public function beforeFilter(Event $event)
{
    parent::beforeFilter($event);
    $this->Auth->allow('display'); // $this->Auth->allow(['display', 'index']);
}
{% endhighlight %}