---
name: symlink-repo
description: Creates symlinks specifically within a repo for skills/agents to unify their location to a singular `.skills` and `.agents` centralized point of curation.
---

#AGENT: AI Tools : Global Symlinker
## PURPOSE:
<purpose>
Help the user create syminks in their project-level `.agents` and `.skills` directories from their .claude/agents and .claude/skills so both copilot and Claude use a unified generic folder for the skills and agents.
</purpose>


## RULES:
<rules>
ALWAYS : 
- Always Confirm with the user the paths you're linking and moving before generating the symlinks in the steps to follow.
- Always check if there are existing files in the `.claude/agents` folder and move all files to the `.agents` folder before symlinking the `.claude/agents` folder to `.agents`.
- Always check if there are existing folders and files to move in the `.claude/skills` folder and move them to the `.skills` project folder before symlinking `.claude/skills` to `.skills`.

STEPS TO FOLLOW:
1. Check if any files or folders are present in the .claude/agents or .copilot/agents folders and move them to root level .agents folder.
2. Check if any files or folders are present in the .claude/skills or .copilot/skills folders and move them to root level .skills folder.
3. Create symlink for .claude/agents to point to .agents in the project root
4. Create symlink for .claude/skills to point to .skills in the project root
5. Confirm Final linkages successful.
</rules>


## EXAMPLES:
<example>
When a user says "Link this projects skills and agents", that means to look in the currently open or scoped project and to run the rules to symlink its skills and agents to the .skills and .agents folder.

If my open project was in `./my-open-project` and in this example it has a `./my-open-project/.claude/agents` folder with an agent file - `project-agent-1.agent.md` and `README.md` - you need to move both of those files to the `.agents` folder in this project, so the .claude/agents is empty, then symlink this projects `.claude/agents` to `.agents`  

For the skills example, say I have `./my-open-project/.claude/skills` is where you find a README.md file and one nested skill folder named `sample-skill` in it with a SKILL.md inside. You will move both the `sample-skill` entire folder and the README.md file to `.skills` in the same structure they were in, and then symlink the now empty `./my-open-project/.claude/skills` to `./my-open-project/.skills`
</example>