---
layout: post
title:  "آموزش نصب jekyll بر روی ویندوز (قسمت سوم)"
date:   2014-10-10 11:00:00
fa-date: شنبه ۲۶ مهر ۱۳۹۳
categories: tutorial
published: true
tags: آموزش وبسایت jekyll tutorial windows ویندوز github گیت namecheap domain دامنه مدیریت
---

<div class="container centeralized">
	<img src="../img/namecheap_github.png" height="150" width="471" alt="jekyll and github logo">
</div>
در قسمت نهایی آموزش نصب jekyll به نحوه اتصال یک دامنه به github خواهم پرداخت. تو این مرحله از وبسایت namecheap برای مدیریت دامنه استفاده کردم.

<a href="http://iakrami.ir/tutorial/installing-jekyll-on-windows-part1.html">آموزش نصب jekyll بر روی ویندوز (قسمت اول)</a>

<a href="http://iakrami.ir/tutorial/installing-jekyll-on-windows-part2.html">آموزش نصب jekyll بر روی ویندوز (قسمت دوم)</a>

سایت [namecheap](http://namecheap.com) یک وبسایت مدیریت دامنه رایگانه که امکانات بسیاری رو در اختیار شما قرار میده. البته شما می تونید برای این کار از هر ابزار و وبسایتی که خواستید استفاده کنید.

ابتدا یک حساب کاربری تو این وبسایت می سازیم و اون رو تایید می کنیم . حالا در منو بالا از قسمت Domains گزینه FreeDNS رو انتخاب می کنیم.
بعد از بارگذاری صفحه آدرس دومین خریداری شده رو وارد می کنیم (برای مثال yourdomain.ir). بعد از وارد کردن آدرس چند ساعت طول می کشه تا این تغییرات ثبت بشه.
بعد از اینکه تغییرات ثبت بشه آدرس جدید تو قسمت FreeDns > Hosted Domains قابل مشاهده است.

با کلیک کردن بر روی نام دامنه وارد محیط تنظیمات دامنه می شیم. اطلاعات مورد نظر رو مشابه شکل زیر وارد می کنیم. دقت کنید که تو قسمت IP Address/URL آدرس github مربوط به وبسایتتون رو وارد کنید.
<img src="../img/namecheap_freedns.png" alt="freedns configuration in namecheap">

بعد از انجام این تغییرات باید تنظیمات مربوط رو توی github هم انجام بدیم.
برای اینکار توی root سایت یک فایل به اسم CNAME درست می کنیم و فقط آدرس دومین مورد نظرمون رو وارد می کنیم.
{% highlight text %}
yourdomain.ir
{% endhighlight %}

به همین سادگی دومین خودتون رو به github وصل می کنید.
