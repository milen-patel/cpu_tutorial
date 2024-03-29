---
title: Let's Design a CPU
---
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-SF6SRSNGQF"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-SF6SRSNGQF');
</script>

# How Do Computers Really Work?

> "Wisdom is not a product of schooling but of the lifelong attempt to acquire it."

For how many of our waking hours we spend each day staring into a screen, it's remarkable how few people understand whats happening on the other side of the glass. It may sound like an overtly complex engineering feat, but it turns out computers, if explained clearly, aren't all that confusing. 

In this series, we will start by designing a basic CPU from scratch called the SAP-1 which was designed by Albert Paul Malvino in 1976. This simple yet powerful processor is designed to be easy to understand while also providing some impressive capabilities. You can even build this CPU after reading this series, which [I did in 2020](https://github.com/milen-patel/BreadboardCPU) when first introduced to the model.

Whether you are a computer science major or a curious learner without engineering experience, this guide is intended to be read by any audience and makes no prior assumption of any knowledge beyond basic math concepts you (hopefully) learned in middle school.

# Table of Contents
* Chapter 01 - *In Progress...*
* Chapter 02 - [How Humans See Numbers](/cpu_tutorial/parts/part02.html)
* Chapter 03 - [How Computers See Numbers](/cpu_tutorial/parts/part03.html)
* Chapter 04 - [Fixed-Width Numbers](/cpu_tutorial/parts/part04.html)
* Chapter 05 - [What about Negative Numbers?](/cpu_tutorial/parts/part05.html)
* Chapter 06 - [Logic Gates](/cpu_tutorial/parts/part06.html)
* Chapter 07 - [Addition with Logic Gates](/cpu_tutorial/parts/part07.html)
* Chapter 08 - [Ripple Carry Adders](/cpu_tutorial/parts/part08.html)
* Chapter 09 - [Arithmetic Logic Unit (ALU)](/cpu_tutorial/parts/part09.html)
* Chapter 10 - [Storing Data with Logic Gates](/cpu_tutorial/parts/part10.html)
* Chapter 11 - [Building a Register](/cpu_tutorial/parts/part11.html)
* Chapter 12 - [An Interlude: How Calculators Work](/cpu_tutorial/parts/part12.html)

# Future Chapters
* Chapter XX - The Clock (Propogation Delay)
* Chapter XX - Interlude: Building a Counter
* Chapter XX - RAM
* Chapter XX - The Memory Address Register (MAR)
* Chapter XX - Program Counter and Computer Architecture
* Chapter XX - The BUS
* Chapter XX - Introduction to Control Unit
* Chapter XX - Instruction Register
* Chapter XX - Revisiting Control and Designing our Instruction Set
* Chapter XX - Output Register and Display
* Chapter XX - Make this an 16-Bit CPU
* Chapter XX - Next Steps
* Chapter XX - Latency and Throughput: Pipelining
* Chapter XX - The Three Main Principles of an Operating System
* Chapter XX - Modifying Hardware to Support an OS
* Chapter XX - Compilers
* Chapter XX - Programming Languages
* Chapter XX - Designing a LISP-Like Programming Language
* Chapter XX - Building a Compiler for our Programming Language
* Chapter XX - Multi Core CPUs
* Chapter XX - Synchornizing Threads

<hr style="width:50%; margin: auto"/>
<img src="https://karenok.github.io/SAP-1-Computer/images/CS.png"
     alt="Logic Gate Diagram"
     style="float: left; margin: 10px;" />

[View entire source](/cpu_tutorial/parts/full_text.html)