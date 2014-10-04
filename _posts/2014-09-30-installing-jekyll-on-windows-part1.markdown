---
layout: post
title:  "آموزش نصب jekyll بر روی ویندوز (قسمت اول)"
date:   2014-09-30 21:00:00
fa-date: چهارشنبه ۹ مهر ۱۳۹۳
categories: tutorial
published: true
tags: آموزش وبسایت jekyll tutorial windows ویندوز
---

<div class="container centeralized">
	<img src="../img/jekyll.png" height="230" width="498" alt="jekyll logo">
</div>
همونطور که تو پست قبلی قولش رو داده بودم اینجا قصد دارم یه توضیح و آموزشی در مورد jekyll داشته باشم.امیدوارم که از این برنامه و آموزش اون در اینجا خوشتون بیاد.
یکی از مشکلاتی که jekyll داره و شاید اکثر برنامه های این شکلی دارن اینه که تو ویندوز به درستی کار نمی کنن. در واقع این برنامه ها برای سیستم عامل لینوکس ساخته میشن.
اما همیشه راه ها یا هک هایی وجود داره که میشه این مشکلات رو رفع کرد.

یکی از این هک ها تو وبسایت [jekyll-windows.juthilo.com](http://jekyll-windows.juthilo.com/) معرفی شده که من خودم از این روش استفاده می کنم ولی باز هم مشکلاتی داشت که در اینجا روشهای حل اون رو توضیح میدم.
در کل اگه با [jekyll](http://jekyllrb.com) آشنایی ندارین می تونین پست «[چرا تصمیم گرفتم از Jekyll استفاده کنم](http://front-end.ir/webdesign/why-i-have-chosen-jekyll/)» رو که امیرعباس زحمتش رو کشیده مطالعه کنید. من خودم از طریق همین پست با jekyll آشنا شدم.

مزیت مهمی که jekyll داره اینه که می تونین از هاست [github](http://github.com) به صورت رایگان برای وبسایت یا وبلاگتون استفاده کنین و تنها با خرید یک دامنه یک وبسایت کامل راه اندازی کنین. این آموزش به سه دسته تقسیم میشه:
<h1>نصب jekyll</h1>
همونطور که تو وبسایت [jekyll-windows.juthilo.com](http://jekyll-windows.juthilo.com/) توضیح داده شده اول از همه نیازه که [Ruby](http://rubyinstaller.org/downloads/) رو نصب کنیم. با مراجعه به [صفحه دانلود ruby](http://rubyinstaller.org/downloads/) نسخه مناسب با کامپیوترمون رو دانلود می کنیم و اونرو نصب می کنیم. توجه کنید که تو مراحل نصب حتما گزینه Add ruby executables to your PATH رو مثل شکل زیر تیک زده باشید. این گزینه باعث میشه از هرجایی به دستورات ruby دسترسی داشته باشیم. البته اگه این گزینه رو تیک نزده باشید می تونین این کار رو دستی انجام بدید.([جستجو کنید](https://www.google.com/#q=how+to+add+executables+to+path+in+windows))

<div class="container centeralized">
	<img src="../img/ruby-path.png" height="399" width="513" alt="Ruby Installation">
</div>

بعد از نصب Ruby نوبت به نصب Ruby DevKit میرسه که از همون آدرس قبلی قابل دسترسی هست. برای نصب ابتدا محتویات فایل zip رو درون یک پوشه (ترجیحا در root یکی از درایورها) که اسمش بدون فاصله و حروف خاص باشه قرار می دیم. بطور مثال <span class="inline-code">C:\RubyDevKit</span> مکان مناسبی برای نصب Ruby DevKit است. پس از قرار دادن فایلها نوبت به اجرای اونها میرسه. کدهای زیر رو برای نصب DevKit توی command prompt ویندوز وارد می کنیم. دقت کنید که باید توی مسیر همین پوشه ایجاد شده باشیم تا بتونیم محتویاتش رو نصب کنیم.
{% highlight ruby %}
C:\RubyDevKit> chcp 1252
C:\RubyDevKit> ruby dk.rb init
C:\RubyDevKit> ruby dk.rb install
{% endhighlight %}
بعد از اینکه نصب ruby و ruby DevKit تموم شد نوبت به نصب jekyll میرسه. برای نصب jekyll کدهای زیر رو توی command prompt ویندوز وارد کنید.
{% highlight ruby %}
gem install jekyll
{% endhighlight %}
 
یکی از مشکلات یا ناسازگاری های jekyll با ویندوز عدم هماهنگی افزونه highlight اون هست که برای حل اون جایگزینی وجود داره. افزونه پیش فرض jekyll برای highlight کردن کدهای درون صفحات، افزونه pygments هست که توی ویندوز اجرا نمیشه و هر دفعه که شما کد رو اجرا کنید پیام خطا میده. برای رفع مشکل highlight از افزونه rouge که با ویندوز سازگاری داره استفاده می کنیم. برای نصب این افزونه کد زیر رو توی command prompt ویندوز وارد کنید.
{% highlight ruby %}
gem install rouge
{% endhighlight %}
در نهایت هم برای اضافه کردن قابلیت watch (مشاهده تغییرات در آن واحد) به jekyll کد زیر رو وارد می کنیم تا افزونه مورد نظر نصب بشه.
{% highlight ruby %}
gem install wdm
{% endhighlight %}

حالا برنامه ما به طور کامل نصب شده و ما می تونیم ازش استفاده کنیم. بطور مثال کدهای زیر یک وبسایت demo در شاخه <span class="inline-code">D:\\</span> میسازه و بعد اون رو برای مشاهده روی آدرس <span class="inline-code">http://localhost:4000</span> قابل دسترس می کنه.
{% highlight ruby %}
jekyll new demo
cd demo
jekyll serve -w
{% endhighlight %}
اگر در مرحله سوم با اجرای کد <span class="inline-code">jekyll serve -w</span> با مشکل برخوردید باید تنظیمات برنامه رو تغییر بدین. به مسیر <span class="inline-code">D:\demo</span> رفته و فایل <span class="inline-code">_config.yml</span> رو با notepad باز کنید. در این فایل تنظیمات وبسایت demo ذخیره شده. به آخر فایل خط زیر رو اضافه کنید که نشون میده ما میخوایم از rouge استفاده کنیم.
{% highlight html %}
highlighter: rouge
{% endhighlight %}
jekyll تنظیمات بسیار زیادی داره که می تونید تموم اونها رو توی وبسایت رسمی [jekyll](http://jekyllrb.com) مشاهده کنید. تو قسمت documentation این سایت تمام ساختار jekyll به سادگی توضیح داده شده که می تونید از اونها استفاده کنید.

در پست بعدی قصد دارم در مورد اتصال github و jekyll بنویسم. خوشحال میشم نظرتون رو در مورد این پست بدونم.

<ul><h3>نکات مهم</h3>
<li>jekyll از زبان نشانه گذاری yaml برای پست ها استفاده می کنه. استفاده از این زبان خیلی خیلی ساده هست و شما فقط کافیه از مثال ها برای یادگیری اون استفاده کنید.</li>
<li>ساختار پوشه ها کاملا مشخصه ولی نکته ای که این وسط مهمه اینه که وبسایت کامل شده و ترجمه شده نهاییتون در پوشه _site ذخیره میشه.</li>
<li>زمانی که از کد <span class="inline-code">jekyll serve -w</span> استفاده می کنید. برنامه در حالت اجرا میمونه و به تغییراتتون توجه می کنه تا اون رو سریع ترجمه کنه و خروجی رو روی پورت 4000 بهتون نشون بده. تنها تغییراتی که به صورت آنی اعمال نمیشه، تغییراتی هست که روی فایل <span class="inline-code">_config.yml</span> انجام می دین. برای اعمال این تغییرات کافیه jekyll رو متوقف کنید و بعد دوباره اون رو اجرا کنید.</li>
</ul>