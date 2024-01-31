---
title: Chapter 12
date: 2024-01-24
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
		<!-- Google tag (gtag.js) -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-SF6SRSNGQF"></script>
		<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'G-SF6SRSNGQF');
		</script>
	</head>
	<a style="margin-bottom:5px" href="/cpu_tutorial">< Go Back</a>
	<p></p>
</html>


# Chapter 12 - An Interlude: How Calculators Work
**Topics Covered:** Registers, ALU

Wow, so we've covered a lot of material so far in the past twelve chapters. I think it's a good time to take a step back and digest what we have learned and try to apply the information we have attained to building something more complicated - a calculator! 

So far, we have seen how computers understand numbers and compute arithmetic using binary. Then, we explored how logic gates can be used to build circuits to manipulate a given binary input into a desired ouput which led us to building the ALU. Finally, in the previous couple chapters, we build on our foundation of circuits to understand sequential logic and create registers to store information. In this chapter, we're going to focus on taking two important concepts we've just learned about - the ALU and registers - and building a calculator.

### Storage and Execution

Our calculator is going to be responsible for doing a couple of things: storing the values we want to input, performing an addition/subtraction operation on the given values, and returning an output. In order to build our calculator, we are going to use some registers to store the input and an ALU to calculate the output (to perform the addition/subtraction).

#### Storage

Essentially, when you type numbers into your calculator, where do you think the numbers get stored temporarily while you keep inputting more instructions into the calculator? If you said they get stored in the register, then you are absolutely correct. As we learned last chapter, registers can be described as a way for computers to store information so the processor can use that information. Calculators function the same way. We can temporarily hold our data in registers, so these registers can feed input into the ALU easily in order for our ALU to perform operations. 