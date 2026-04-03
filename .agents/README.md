# AGENT CREATION:
1. **CREATE FILE:** Create new agent file in our `.agents` directory named `<agent-name>.agent.md`. 

2. **ADD METADATA:** Use this template to curate its name & description.

3. **ADD DETAILS:** Fill in with desired context, typically doing section `## Purpose` `## Rules` and `## Examples` at a minimum.


<br>

Below is our MVP Quickstart to get you up and running fast, and there are a few examples in `.agents` directory:
- [Agent : Code Reviewer](./code-reviewer.agent.md) 
- [Agent : Agents/Skills Symlinker - Global](./symlink-global.agent.md)
- [Agent : Unblocked](./unblocked.agent.md) Good MCP Sample *(Requires Unblocked MCP Server running)*

<br>

**SYNTAX:** `<purpose>`, `<rules>` and `<example>` XML Tags are extras for **Claude Code**'s preferred way to declare these aspects, but are not rigid requirements - Claude will still work with plain markdown. Copilot ignores the XML sometimes so we do both to conventionalize best.


## QUICKSTART:
```markdown
---
name: NAME OF AGENT (Shown in Copilot List)
description: Brief description of intent (shown in copilot hover over agent name)
tools: [list of tools the agent will use] (VS Code shows a "Configure tools" right above it to make this easy!)
---

## PURPOSE:
<purpose>
My agents purpose (1-5 sentences)
</purpose>


## RULES:
<rules>
Rules of engagement that this agent should always abide by
1. First rule to obey on every run
2. Another rule to obey
3. And so forth...
</rules>


## EXAMPLES:
<example>
An example of something to help the agent conceptualize the work.
</example>

<example>
Another example to help clarify the intended outcomes.
</example>
```