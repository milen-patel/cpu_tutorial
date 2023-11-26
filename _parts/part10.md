---
title: Chapter 10
date: 2023-11-26
---

<html>
	<head>
	    <!-- Include MathJax script -->
		<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
	</head>
	<a style="margin-bottom:5px" href="/cpu_tutorial">< Go Back</a>
	<p></p>
</html>


# Chapter 10 - Sequential Logic
**Topics Covered:** Determinism vs Non-Determinism

You've seen a decent number of circuits created by logic gates so far, and have even built up the first component of the CPU, the ALU. But, we can't progress any further without having a way to store data. What is the point of having an ALU that can add and subtract numbers if we have no means of storing the result? The answer is that there isn't really a point.

So the focus of the next few chapters will be solving this issue. In chapter 6, I told you that we can build an entire computer out of logic gates which means that we also have to be able to store binary values with logic gates. You might be thinking that this is impossible, but it turns out we can manipulate logic gates to create circuits that store bits!

Until this point, every logic circuit we have introduced has been **deterministic**. This means that the output of the circuit depends strictly on the inputs, and whenever you set the inputs to a given value, the output will always be the same. This may sound obvious, but take a look at the circuit below.

<img src="https://milen-patel.github.io/cpu_tutorial/assets/part10/Example1.png" style="display: block; margin-left: auto; margin-right: auto;" />

This should look very confusing - we have the output of a logic gate feeding back into the input of a logic gate. Is this even valid? The answer is yes, and it is this exact mechanism that enables us to store information in logic gates. But let's look at this gate a bit closer to see what happening. The first claim which I will make is that, at the initial configuration, the output of all logic gates is zero. Just assume this to be true for now, and over the next few chapters it will become clear why this is a convenient assumption to make. 

So, we start with this circuit where $$X$$ is initially zero and, by assumption, the output of the logic gate is zero. This means that, assuming we leave everything alone, the two inputs to the logic gate are both zero, so the gate will output a zero. The interesting case arises when we then switch the value of $$X$$ to 1. 

When that happens, one of the inputs to the OR gate is now a 1 (namely the bottom input in the diagram), so the overall output of the gate becomes a 1. Since the output of the gate is being fed in as the top input, this means that there is now a 1 on that wire which is being fed into the gate. So, both of the inputs to the OR gate are one.

Now, suppose we turn off the input $$X$$ so it becomes a zero. What should happen? In this case, the output stays as 1! This is because the output of the gate right before we turned off $$X$$ is a 1. This value is 'trapped' on that upper wire. When we turn off $$X$$, the output of the gate stays at 1 because the top input is 1. Similarly, the top input stays as 1 since the output of the gate is still a 1. So now, no matter how much we toggle $$X$$ on and off, the output of that logic gate will always stay at 1.

If you're anything like I was, you should find this incredibly confusing. Sit down for a minute and really think about what's happening here.

If we had to describe the behaviour of the circuit in English, we could reason as follows: "The value of OUT will be a 1 if X was, at any point in history, a 1. If X has always been zero, then the gate will output a zero."

Now in all honesty, reading that explanation might have made you realize that this is a pretty useless circuit. It doesn't serve a valuable purpose besides me confusing you. But what this does introduce is the idea of **non-determinism**. We originally said that all of our previously encountered circuits are deterministic because they always give the same output for a fixed input. Here, however, we have found this to not be true. We saw two different scenarios where the input was a zero but in one case the circuit outputted a 1 and in the other case a 0. This is the essence of non-determinism: the output of circuits now depends both on current inputs and previous inputs. For these non-deterministic circuits, which I will also refer to as **sequential circuits**, the concept of using a truth table no longer makes sense since the information in each row (i.e. the current inputs) is not enough to explain the output. In some casees, we can modify our truth tables to include previous inputs and then truth tables may be used, but in many cases this is not practical.

# Latches

Now that we have introduced sequential logic, it's time to see how we can create sequential circuits that store information. The first circuit we will examine is called a latch.