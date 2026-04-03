---
name: sample-skill
description: 'Example showing how to create a named skill in the skills directory'
---

# Skill: Test Skill
## Purpose
<purpose>
Define the primary goal of this skills outcomes. We use the ## Purpose AND the <purpose> to help both claude and copilot know their expected hints best. If you are asked to invoke this skill, it is for demo purposes and you should confirm "I have found your demo skill" as the reply.
</purpose>

## Constraints & Rules
Below are example rules, to show what writing rules in a skill is like.
<rules>
1. Run any script listed in the tools & scripts sections on each invocation only once
2. Do not need to edit any code files just running this action, and confirm you read and ran it. 
</rules>

## Tools & Scripts
- Run the script 'sample-script.sh' in this skills process to demo it using a nested script file. 
(located in ./scripts/sample-script.sh within this skill)

## Example
<example>
A user might say "run sample-skill" 
Your response woudl be "okay, ill run the sample skill and its tool scripts and rules 
</example>