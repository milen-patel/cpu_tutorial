---
title: Chapter 6
date: 2023-11-10
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

# Chapter 06 - Logic Gates
**Topics Covered:** Elementary Logic Gates, Truth Tables, Basic Circuits, The Universal Gate

Now that I've made you suffer through enough chapters of binary, it's time to introduce a seperate yet similarly related concept: logic gates. There's a few different types of logic gates we will need to understand, so I will introduce them one-by-one and then we will circle back and understand the bigger picture. This chapter should (hopefully) be a lighter read compared from the last few which probably involved you using a calculator to double check everything I was saying.

Simply put, a logic gate takes in a variable number of inputs (atleast 1) and produce a single output. The interesting part is that all the inputs and outputs are either 0's or 1's. We have spent a few painful chapters understanding the nuances of binary, but you can put that aside for this chapter. In the next chapter, the connection between this chapter and all the previous ones will become apparent.

### AND Gate

Let's start with the AND gate which takes in two inputs, and produces one output. If both of the inputs are 1, then the output of the AND gate is 1. For any other combination of inputs, the output will be a zero. The following image is what an AND gate looks like: X and Y serve as the two inputs and the output is given on the right hand side.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/AND.png" style="display: block; margin-left: auto; margin-right: auto;" />

Recall that, in the picture above, X and Y are binary inputs. So X can be either 0 or 1 just as Y can be either 0 or 1. We know that the only time that output is 1 is when $$X=1$$ and $$Y=1$$. Another way to view the functionality of the gate is by giving a **truth table**. A truth table is a table (duh) that enumerates all of the different possible input combinations on the rows while providing the output of the logic gate on the right-most column. See the table below. There are only four rows in this table, because with two binary inputs, there are only four different input combinations (try invent another one if you don't believe me).

*Remark: For the following diagrams (and all diagrams in subsequent chapters), the darker green is used to represent a 0 while the brighter green represents a 1. The lines on the diagrams are wires, and the only thing you need to recall is that when we put a 0 or a 1 on a wire (i.e. electricity or no electricity), the wire will conduct that value over it's entire length.*

**AND Gate Truth Table:**

| X | Y | AND | Picture
|---|---|---|---|
| 0 | 0 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/AND_00.png" /> |
| 0 | 1 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/AND_01.png" /> |
| 1 | 0 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/AND_10.png" /> |
| 1 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/AND_11.png" /> |

### OR Gate

Now, lets move on to the OR gate which also takes in two inputs. The difference here is that this gate will output a 1 whenever atleast 1 of the inputs is 1. If both of the inputs are a one, the output of the gate will still be 1. It also does not matter which of the inputs is 1, the output will be 1 as long as either of the gates is 1. With this information, we can reason that the only time an OR gate will ever output a 0 is if both of the inputs are 0's. Here's what an OR gate with inputs named X and Y looks like:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/OR.png" style="display: block; margin-left: auto; margin-right: auto;" />

Just as we gave a truth table for the AND gate, below is the truth table for an OR gate.

**OR Gate Truth Table:**

| X | Y | OR | Picture
|---|---|---|---|
| 0 | 0 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/OR_00.png" /> |
| 0 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/OR_01.png" /> |
| 1 | 0 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/OR_10.png" /> |
| 1 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/OR_11.png" /> |


### XOR Gate

Similar to the OR gate is the XOR gate which means "Exclusive OR". The difference between this gate and the regular OR gate is that this will only output a 1 if exactly 1 of the inputs is 1. So, if both of the inputs are 1's, then the gate will output a zero. Besides this, the other three rows in the truth table remain unaffected. A picture of the gate and truth table are given below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR.png" style="display: block; margin-left: auto; margin-right: auto;" />

**XOR Gate Truth Table:**

| X | Y | XOR | Picture
|---|---|---|---|
| 0 | 0 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_00.png" /> |
| 0 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_01.png" /> |
| 1 | 0 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_10.png" /> |
| 1 | 1 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_11.png" /> |

### NOT Gate

The NOT gate, sometimes called an inverter, is different than the rest we have considered so far because it only takes in one input. Since there is one input and the input is binary, we know that the truth table will only have two rows to represent the two sole possible input values. The inverter will output the inverse of the input. So, 1's become 0's and vice versa. Below is an image of an inverter followed by its corresponding truth table.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NOT.png" style="display: block; margin-left: auto; margin-right: auto;" />

**NOT Gate Truth Table:**

| X | NOT | Picture
|---|---|---|
| 0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NOT_0.png" /> |
| 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NOT_1.png" /> |


### NAND Gate

Now we move onto the NAND gate which, in English, reads "Not AND". This gate will take whatever the output is of the AND gate and invert it. The NAND gate will output a 1 unless both inputs are 1's in which case it will output a zero. This means the the truth table will be the exact opposite of the AND gate's truth table. The diagram and truth table are given below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND.png" style="display: block; margin-left: auto; margin-right: auto;" />

**NAND Gate Truth Table:**

| X | Y | NAND | Picture
|---|---|---|---|
| 0 | 0 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND_00.png" /> |
| 0 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND_01.png" /> |
| 1 | 0 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND_10.png" /> |
| 1 | 1 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND_11.png" /> |

What's interesting is that the NAND gate can be constructed by taking a regular AND gate and then feeding the input through a NOT gate. This is entirely valid, we can chain logic gates together to build more powerful circuits. So, this circuit below is functionally equivalent to a NAND gate.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/NAND_Construction.png" style="display: block; margin-left: auto; margin-right: auto;" />

We have subtly introduced a new concept: **logic circuits**. When we feed the output of a logic gate into the input of another logic gate, we can create more useful and complex circuits. Whereas a logic gate always takes in one or more input and produces a single output, a logic circuit takes one or more inputs and produces a **variable** number of outputs. We will see this in action in future chapters.

Similarly, we can construct the XOR gate with the following combination of other logic gates.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_Construction.png" style="display: block; margin-left: auto; margin-right: auto;" />

We can verify this is equivalent by comparing the truth tables.

| X | Y | XOR | Picture | New Picture
|---|---|---|---|
| 0 | 0 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_00.png" /> | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_Construction_00.png" /> |
| 0 | 1 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_01.png" /> | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_Construction_01.png" /> |
| 1 | 0 |  1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_10.png" /> | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_Construction_10.png" /> |
| 1 | 1 |  0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_11.png" /> | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/XOR_Construction_11.png" /> |

This one is a little bit harder to understand. The easiest option is to create a truth table for this circuit and then compare it against the truth table for the XOR gate to see that they always output the same value for any input. If you're like me, this alone won't satisfy you since you want an intuitive explanation. Here is how I would reason through this: the circuit ends with an AND gate which means it only outputs a 1 when both of the inputs are 1's. How do we make the first input a 1? The first input to the AND gate will be a one whenever X or Y is true since the input to the AND gate is the output of an OR gate. How do we make the second input to the AND gate a 1? We make the output of the NAND gate a 1. This happens as long as the inputs are not both 1. So we know the two conditions, and we need them to be true simultaneously. So putting this together, we can reason that the circuit will only output a 1 if "atleast X or Y is a 1 BUT not both of them are 1". And this is exactly how we described the XOR gate!

These few logic gates may seem very simple to understand compared to binary, but it turns out they can be chained together to do some pretty interesting things. Consider the circuit below with three inputs which, at first glance, probably looks like gibberish. But if you make a truth table for it, you will see that the circuit is a switch. Whenever Z is 0 the gate outputs whatever the value of X is. Whenever Z is 1, the gate outputs whatever the value of Y is. So, Z is effectively switching the output between X and Y. Pretty neat! 

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_Construction.png" style="display: block; margin-left: auto; margin-right: auto;" />

The truth table has been given below, but you should try complete it on your own. 

| X | Y | Z | Output | Picture
|---|---|---|---|---|
| 0 | 0 |  0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_000.png" /> |
| 0 | 0 |  1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_001.png" /> |
| 0 | 1 |  0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_010.png" /> |
| 0 | 1 |  1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_011.png" /> |
| 1 | 0 |  0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_100.png" /> |
| 1 | 0 |  1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_101.png" /> |
| 1 | 1 |  0 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_110.png" /> |
| 1 | 1 |  1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Switch_111.png" /> |

*Aside: By now, you probably notice a pattern while creating the truth tables. The number of possible ouputs can be expressed by the expression $$2^n$$ where n is the number of inputs. You will continue to see this idea throughout the course of the next few chapters!*

Let's try make some sense of this logic diagram intuitively. We notice that the output of the entire circuit is the two values of the AND gates OR'd together. So, as long as one of the AND gates is outputting a 1, then the entire circuit will output a 1. However, if neither of the gates output a 1, then the entire circuit will output a zero. Then, we look at the two AND gates and make the powerful observation that the input Z is being fed into both of the AND gates (although one is indirect). The value of Z feeds straight into the bottom AND gate while the top AND gate recieves the negated value of Z. This means that whenever Z is equal to 1, a 0 is fed into the top AND gate while a 1 is fed into the bottom AND gate. Conversely, whenever Z is equal to 0, a 1 is fed into the top AND gate while a 0 is fed into the bottom AND gate.

Why does this matter? Well we know that an AND gate will only output a 1 if both of its inputs are 1. Combine this with the fact that, for any value of Z, one of the AND gates will recieve a 1 for one of its inputs while the other will recieve a 0. The AND gate that recieves a 0 will automatically output a 0, regardless of it's other input, since this is a property of the AND gate (i.e. needing both of its inputs to be 1s for output to be 1). So, the value of Z will effectively shut off one AND gate by giving it a 0 for an input.

When Z is 0, the bottom AND gate is 'shut off' and outputs a zero. So, the output of the overall circuit is equal to 0 OR'd with the output of the top AND gate. Since the OR gate only turns on when one of the inputs is a 1, and we know one of the inputs is already a 0, we can reason that the output of the entire circuit will equal the output of the upper AND gate. So, what is the output of the upper AND gate? It would be 1 (from Z) OR'd with the value of X. With similar reasoning, we can see that this simply equals the value of X. So, when Z is 0, we allow the value of X to 'flow' through the circuit to the output. We also can see how there is no possibility of interference since the entire bottom half of the diagram is guaranteed to be zeroed out in this case.

When Z is 1, the exact reverse thing happens! The top AND gate is forced to output a zero since one of its inputs is a zero. Then, the output of the entire circuit equals the output of the bottom AND gate. The output of the bottom AND gate equals the value of Y since we know the other input is the 1 coming from Z. So, the output of the entire circuit is the value of Z.

For some readers, everything I just said will make sense. For others, however, only half of what I just explained will click. Don't read ahead until you are able to clearly understand what was just written. This is a new concept, so don't be discouraged if it doesn't immediately make sense. On top of it being a new concept, I am also intentionally introducing this to you at a fast pace to avoid getting into the nitty-gritty.

### A better way of expressing circuits

So far, I have been using diagrams to visualize circuits, but only using diagrams will become complicated as we move forward in the next chapters. Instead, it would be nice if we could represent some of these diagrams using just text. Fortunately, this problem has already been solved, so we will spend some time here seeing how we can express logic gates in a textual form. For this subsection, lets assume that $$A$$, $$B$$, $$C$$, or any letter is a binary input (i.e. a variable that takes on either the value 1 or the value 0).

We start with the logical AND expression, which can be represented with multiplication or the absence of a sign. So, $$A*B$$ and $$AB$$ are equivalent expressions that read in English as "A and B". With just two inputs, this can easily be translated to a simple logic gate with two inputs. If we gave the expression $$ABC$$ (equivalent to $$A*B*C$$), then this translates to "A and B and C". But the AND gate we learned about only takes two inputs? Well, logical expressions and logic circuits are very similar, but you usually need to find a way to express a logical expression using logic gates. In the case of $$ABC$$, we can easily invent the circuit below:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Triple_AND.png" style="display: block; margin-left: auto; margin-right: auto;" />

We could even scale this up to any number of variables. Here's how the expression $$ABCD$$ would look like as a circuit:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Quad_AND.png" style="display: block; margin-left: auto; margin-right: auto;" />

Before we move on to see how we can textually represent other logic gates, let's understand why we use multiplication for representing the logical AND. Recall that in an expression, all of the variables ($$X$$, $$Y$$, $$Z$$, etc.) are binary inputs. When we go to evaluate a logical expression, we substitute in 0's and 1's accordingly for all of the variables and after some manipulation, expect to end up with either 0 or 1 (because the expression has to evaluate to a single binary value). So, if you recall from your high school algebra class, if we multiply anything by zero, the final output is zero. So when we have an expression such as $$X*Y*Z$$, if any variable is zero, then the entire thing resolves to zero, and the only case which this can evaluate to a 1 is if all three variables are one. It's convenient that our notation for logical expression abides by basic algebraic properties since it eases your intuitive ability to grasp what an expression is saying. The reason we can omit the explicit multiplication signs ($$XYZ$$ instead of $$X*Y*Z$$) also relates to algebra. If $$P$$ is a variable, then algebra tells us that $$5p$$ is equivalent to $$5*p$$, so in the latter case, the use of the multiplication sign isn't required since we can infer that a lack of an operator means to multiply the two operands.

So, we've seen how the logical AND can be represented in this written form, so how do logical OR's work? The answer is with addition. $$X + Y$$ reads out to "X or Y". Similarly, $$X + Y + Z$$ reads out to "X or Y or Z". The (roughly speaking) reason we use the addition sign to represent logical OR is because you need only one of the variables to evaluate to 1 for the expression to be true (i.e. $$0 + 1 = 1$$).

Just as logic gates can be chained together, operators in a logical statement can be chained together. For example $$X + YZ$$ would translate to "X or both Y and Z". With logic gates, this would look like the diagram below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Example1.png" style="display: block; margin-left: auto; margin-right: auto;" />

As is the case with algebra, the use of parenthesis is valid (and often necessary). That *PEMDAS* acronym you haven't heard in years is valid here for specifying order of operations in that parenthesis should be evaluated before multiplication which should be evaluated before addition (the rest of the operators in PEMDAS don't really exist in our means of representing expressions). For sake of illustration, the following expression is visualized by the diagram below: $$X(Y + Z)$$

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Example2.png" style="display: block; margin-left: auto; margin-right: auto;" />

For logical negation (NOT), there are two different but equally valid representations: $$\neg{X}$$ or $$\overline{X}$$. You will see these used interchangeably online, but for the sake of this book, we will stick to the latter representation. So the expression $$\overline{(A + B)}(C + D)$$ can be represented with logic gates accordingly:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Example3.png" style="display: block; margin-left: auto; margin-right: auto;" />

To represent XOR, we have this odd looking symbol: $$\oplus$$. So $$X\oplus Y$$ is the exclusive-OR between variables X and Y.

As it turns out, those three operators combined with the order of operations you already know intuitively are enough to represent any combination of logic gates. For example, although we don't have a NAND symbol, we can represent NAND with an inverted AND: $$\overline{XY}$$

As you can probably imagine, these expressions can get incredibly complicated and virtually impossible to read. There is an entire field of study that involves simplying expressions down as much as possible. In many cases, it is easy to take a convoluted expression and simplify it down to a more readable expression. For example, the following expressions are logically equal but the second is more readable than the first: $$AB + DA + AC \equiv A(B + D +C)$$ (The triple equals is used to show logical equality). Reducing expressions can get complicated rather quickly, and I don't want it to be a primary concern of this book. As we introduce and simplify expressions in the future, you will either be presented with the steps taken to simplify the expression or given the final reduced expression. In either scenario, you do not need to focus heavily on *how* the statements were simplified, and it is safe for you to accept our simplified equations as the truth.

*Aside: You can search the internet for basic laws of boolean algebra. These common laws can be used to simplify expressions further. In future examples in the book, we will mention what laws we are using to simplify the expression, but again, don't worry about this too much as this is not the focus of the book.*

That being said, there are two famous simplifications that I will provide below. These simplifications are called De Morgan's laws and come up frequently in expression simplification. You should take some time to reason through why the two claims are logically true.

$$\overline{AB} \equiv \overline{A} + \overline{B}$$

$$\overline{A + B} \equiv \overline{A}\ *\ \overline{B}$$

### The Bigger Picture

We have now introduced these very basic structures called logic gates. You immediately saw how they can get complicated when you start chaining them together, but that such combinations actually enable you to build rather interesting circuits. I will now make a claim which, barring one or two minor exceptions which we will later address, is both true and remarkably powerful.

Claim: *computer processors are built entirely of logic gates*. You might be reading that in denial, but this is the unexaggerated truth: logic gates are the building blocks of computers. By chaining hundreds, millions, or even billions of logic gates together, you can build a fully functional computer. And that is the exact goal of this book.

You saw how we can chain logic gates together to build a switch, so in the coming chapters we will explore more complex yet powerful arrangements of logic gates that implement other useful circuits. We will then combine these known circuits together to build an entire computer.

If logic gates can be used to build computers, and you are holding a physical computer in your hand right now, does that mean logic gates physically exist? The answer is yes, you can seriously purchase a [10 pack of AND gates](https://www.amazon.com/Texas-Instruments-CD4081BE-Quad-DIP-14/dp/B00LQQ9MEW/ref=sr_1_4?crid=3P76A27E7NX9X&keywords=AND+gate+ic&qid=1700533554&sprefix=and+gate+ic%2Caps%2C87&sr=8-4) on Amazon for $6.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/IC_Physical.jpeg" style="display: block; margin-left: auto; margin-right: auto;" />

Let's actually take a minor digression to see how the physical chips work. If you click the link, you'll quickly see that the AND gate on Amazon looks nothing like the AND gates in our logic diagram.

<img src="https://cdn.sparkfun.com/assets/5/b/9/9/b/51dc7fb8ce395f1d1c000000.png?_gl=1*j716c4*_ga*MTY3NTE1NDc1My4xNzAwNTM5MTY1*_ga_T369JS7J9N*MTcwMDUzOTE2NS4xLjAuMTcwMDUzOTE2NS42MC4wLjA." style="display: block; margin-left: auto; margin-right: auto; width=40%" />

In the diagram, pins 7 and 14 are used to power the chip, so we can ignore those. Look at the first three pins, however, and you will see an AND gate. The first two pins are the input while the third pin is the output. This means that if you connect pins 1 and 2 to wires and then place electricity on the both of the wires (hence the AND), the chip will put electricity onto the third pin. Looking at the rest of the diagram, you can see that there are a total of four AND gates on this chip. You do not need to understand how these chips are physically built, and if I'm being honest, I don't have the clearest understanding myself. We will build our computer strictly using logic gates, and that will be the lowest level of understanding we have for how this computer can be physically built. If you *really, really* want to know how logic gates are physically built, there is an abundance of resources online, none of which make perfect sense to me. So yes, perhaps I lied a little bit in the introduction when I claimed that you would understand how a computer works from scratch. In reality, you will understand how computers work down to logic gates, and we will leave that very lowest level of physically building the gates aside. For those of you curious, there is actually a really neat [article](https://hackaday.com/2021/04/26/logic-flows-literally-in-this-water-adder/) about someone who implemented logic gates with water. If you're looking for a little more explanation on how logic gates work but don't want to go into the nitty-gritty of electricity, then this article should hopefully satisfy your craving.

*Aside: We will be using these chips in our circuit diagrams in future chapters, but don't worry! We will walk you through how the chip we will be using works!*

### Optional: The Universal Gate

This chapter has already covered enough material, and I don't want to distract you by adding even more to that load. But, there is one concept that I remember blowing my mind when I was first learning about logic gates. 

The mindblowing fact: All logic gates can be constructed by using NAND gates. If you don't believe me, then take a look at the diagram below which shows some of the gate construction and verify that the truth tables work out equivalently.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/Universal_Gate.png" style="display: block; margin-left: auto; margin-right: auto;" />

We previously claimed that you can build an entire computer out of logic gates. Now that we know the NAND gate can be used to construct any other logic gate, we can make the secondary claim that you can build an entire computer solely using NAND gates. This is pretty neat!

### Optional: Sum of Products (SOP)

This section isn't too important to the course of the book, but it is a basic idea/rule you should be aware of since it allows us to build circuits given any set of inputs/outputs. Let's say that we were randomly given a truth table which contains 3 inputs and a random assortment of outputs which are true and false:

| X | Y | Z | Output |
|---|---|---|---|
| 0 | 0 | 0 | 0 | 
| 0 | 0 | 1 | 1 | 
| 0 | 1 | 0 | 0 | 
| 0 | 1 | 1 | 1 | 
| 1 | 0 | 0 | 0 | 
| 1 | 0 | 1 | 1 | 
| 1 | 1 | 0 | 0 | 
| 1 | 1 | 1 | 0 | 

Our challenge is that we need to build a circuit which represents this truth table and it's inputs and outputs accurately. Well, we can actually do that by using the sum of products (SOP) trick! 

The first step of this process is we need to find every row in the table that has an output of 1. In our example, this is row #2, row #4, row #6. The next step is to look individually at each of these rows and come up with a respective formula that gives the output of 1 for that row's inputs. For example, looking at row #2, we see that the output is 1 when $$X=0$$, $$Y=0$, and $$Z=1$$. We, then, multiply the inputs (if the input is a 0, negate the input). This means for row #2, our formula is $$\overline{X}\overline{Y}Z$$. We can use the same trick for row #4 and #6. For row #4, the output is 1 when Y and Z are both 1 and X is 0, so the equation can be represented as $$\overline{X}YZ$$. Finally, for row #6, the output is 1 when X and Z are both 1 and Y is 0, so the equation can be represented as $$\overline{Y}XZ$$. Essentially, we are finding the product equation for every row that has an output of 1 by multiplying the inputs together.

The next step of this process is to add all the products (equations) we found together: $$\overline{X}\overline{Y}Z$$, $$\overline{X}YZ$$, $$\overline{Y}XZ$$. This results in the expression $$\overline{X}\overline{Y}Z + \overline{X}YZ + \overline{Y}XZ$$. Now comes the exciting part. We can further simplify this expression:

* Start with the initial expression: 

<div style="text-align: center;"><strong>$$\overline{X}\overline{Y}Z + \overline{X}YZ + \overline{Y}XZ$$</strong></div>

* Use the distributive law to further isolate the equation: 

<div style="text-align: center;"><strong>$$Z(\overline{X}\overline{Y}+\overline{X}Y+X\overline{Y})$$</strong></div>

* Use the distributive law to further isolate the equation: 

<div style="text-align: center;"><strong>$$Z(\overline{X}(\overline{Y}+Y)+X\overline{Y})$$</strong></div>

* Use the rule $$\overline{X} + X = 1$$: 

<div style="text-align: center;"><strong>$$Z((\overline{X}(1))+X\overline{Y})$$</strong></div>

* Use the rule $$X*1 = X$$: 

<div style="text-align: center;"><strong>$$Z(\overline{X}+X\overline{Y})+$$</strong></div>

* Use the rule $$X\overline{Y}+Y = X + Y$$

<div style="text-align: center;"><strong>$$Z(\overline{Y} + \overline{X})$$</strong></div>

We can now build a circuit for the equation $$Z(\overline{Y} + \overline{X})$$:

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_1.png" style="display: block; margin-left: auto; margin-right: auto;" />

We can also verify that the circuit works for the inputs/outputs of the truth table:

| X | Y | Z | Output | Picture |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_1.png" /> |
| 0 | 0 | 1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_2.png" /> |
| 0 | 1 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_3.png" /> |
| 0 | 1 | 1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_4.png" /> |
| 1 | 0 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_5.png" /> |
| 1 | 0 | 1 | 1 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_6.png" /> |
| 1 | 1 | 0 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_7.png" /> |
| 1 | 1 | 1 | 0 | <img src="https://milen-patel.github.io/cpu_tutorial/assets/part6/images/SOP_8.png" /> |