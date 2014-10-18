---
layout: post
title:  "آموزش نصب jekyll بر روی ویندوز (قسمت دوم)"
date:   2014-10-04 11:00:00
fa-date: شنبه ۱۲ مهر ۱۳۹۳
categories: tutorial
published: true
tags: آموزش وبسایت jekyll tutorial windows ویندوز github گیت
---

<div class="container centeralized">
	<img src="../img/jekyll_github.png" height="230" width="600" alt="jekyll and github logo">
</div>
در قسمت دوم آموزش نصب jekyll، نحوه اتصال این برنامه به یک صفحه github و طریقه پیکربندی اون رو توضیح خواهم داد. در اینجا نکته ای که بسیار اهمیت داره نحوه پیکربندی برنامه تو ویندوز هست.
چون اجرای jekyll روی ویندوز با تنظیمات پیش فرض github به دلیل ناسازگاری افزونه هایی مثل pygments پیغام خطا میده.

<a href="http://iakrami.ir/tutorial/installing-jekyll-on-windows-part1.html">آموزش نصب jekyll بر روی ویندوز (قسمت اول)</a>

<h1>ایجاد حساب github</h1>
بعد از ثبت نام در وبسایت [github](http://github.com)، در منو بالا New Repository رو انتخاب کرده و یک [مخزن](http://git-scm.com/book/en/Getting-Started-Git-Basics) ایجاد کنید. در قسمت نام مخزن، عبارت <span class="inline-code">username.github.io</span> رو وارد کنید (بجای username نام کاربری خودتون رو بنویسید). ما بقی تنظیمات را در حالت پیش فرض قرار دهید.

سپس با استفاده از نرم افزار github در ویندوز از مخزن خود clone بگیرید و اونو تو یک فولدر بریزید [(آموزش)](https://help.github.com/articles/adding-repositories-with-github-for-windows/).

خب حالا نوبت به jekyll میرسه. در اینجا باید یک وبسایت جدید با jekyll تو همون مسیر ایجاد کنید. به طور مثال اگه مسیر مخزن شما <span class="inline-code">C:\username.github.io</span> باشه کد زیر رو وارد می کنید.
{% highlight ruby %}
jekyll new C:\username.github.io
{% endhighlight %}
تنظیمات مربوط به وبسایتتون که شامل نام و توضیحات و ... میشه رو تو فایل <span class="inline-code">_config.yml</span> وارد کنید. بعد از تغییر دادن محتویات این فایل اون رو تو همین مسیر با نام جدید مثلا <span class="inline-code">win_config.yml</span> کپی کنید. تو فایل جدید کد زیر رو به انتهای فایل اضافه کنید.
{% highlight text %}
highlight: rouge
{% endhighlight %}
دلیل ایجاد این فایل و اضافه کردن این خط اینه که می خوایم برنامه تو ویندوز با فایل تنظیمات دوم اجرا بشه تا مشکلی برای اون پیش نیاد ولی موقع آپلود و قرار گرفتن روی سرور فایل اصلی اجرا بشه.

اگر دقت کنید یک فایل با نام <span class="inline-code">.gitignore</span> توی مسیر اصلی مخزنتون وجود داره. اونرو باز کنید و اسم فایل دوم رو بهش اضافه کنید. این فایل مشخص می کنه که چه فولدرها و فایلهایی از کامپیوترتون به سرور آپلود نشه. احتمالا فولدر <span class="inline-code">_site</span> قبلا به این فایل اضافه شده.

بعد از اینکه تموم این تنظیمات رو انجام دادید می تونید با jekyll وبسایت خودتون رو بسازید و اونرو بعد از هر بار commit کردن تو آدرس username.github.io ببینید.

<ul><h3>نکات مهم</h3>
<li>تنظیمات زیر در github بعد از هر بار اجرا بازنویسی می شن و شما نمی تونین این تنظیمات رو به هیچ شکلی عوض کنید:
{% highlight text %}
highlighter: pygments
safe: true
lsi: false
github: [Repository metadata]
{% endhighlight %}
</li>
<li>تنظیم source رو به هیچ وجه دستکاری نکنید.</li>
<li>چون jekyll در github به صورت safe بالا میاد پس هیچ افزونه اضافی رو برای jekyll نمی تونید اضافه کنید.</li>
<li>لیست تنظیمات jekyll در <a href="http://jekyllrb.com/docs/configuration/">این صفحه</a> موجود است.</li>
</ul>

در پست بعد اتصال دامنه به github رو آموزش خواهم داد. لطفا نظرات و سوالاتتون رو در مورد این پست در قسمت نظرات عنوان کنید.

<a href="http://iakrami.ir/tutorial/installing-jekyll-on-windows-part3.html">آموزش نصب jekyll بر روی ویندوز (قسمت سوم)</a>