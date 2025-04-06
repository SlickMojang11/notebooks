# 📘 PROMPTS.md — Prompt Design Guide for NoteBook-X

Welcome to the **Prompt Design Guide** for the `NoteBook-X` project. This guide is here to help you understand how we use prompts to generate high-quality, AI-assisted study notes using tools like **ChatGPT** and **Gemini**.

---

## 🎯 Purpose of This Guide

- 🤖 Show how prompts are used to generate educational content
- ✍️ Teach contributors how to write or improve prompts
- 🔍 Help ensure uniform quality and structure across all notes
- 📁 Explain folder structure and naming conventions

---

## 🧠 What is a Prompt?

A **prompt** is a carefully crafted instruction given to an AI model like ChatGPT to produce a desired output. For this project, prompts generate:

- 🔍 Chapter summaries
- 📝 Key point bullet notes
- ❓FAQs & PYQs
- 🧾 Structured diagrams, tables, and timelines
- 💡 Key concepts

---

## 🗂️ PROMPTS Directory Structure

```
PROMPT-DESIGNS/
├── ENGLISH/
├── INFORMATION-TECHNOLOGY/
├── MATHS/
├── SCIENCE/
│   ├── BIOLOGY/
│   ├── CHEMISTRY/
│   └── PHYSICS/
└── SOCIAL-SCIENCE/
    ├── ECONOMICS/
    │   └── DEVELOPMENT.md
    ├── GEOGRAPHY/
    │   └── RESOURCE_AND_DEVELOPMENT.md
    ├── HISTORY/
    │   └── RISE_OF_NATIONALISM_IN_EUROPE.md
    └── POLITICAL-SCIENCE/
```

Each `.md` file should be named by the Chapter Name. Example: `RISE_OF_NATIONALISM_IN_EUROPE`

---

## ✍️ Prompt Format Template

Here’s a sample structure for each prompt file:

```md
# 📘 [Subject] - Chapter [Number]: [Chapter Title]

## 🎯 Objective
Explain what you want the AI to generate. (e.g., “Summarize Chapter 1 in 10 bullet points”)

## 🧠 Prompt Used
```
[Paste the actual prompt you gave to the AI. Example below:]

"Summarize Chapter 1 from Class X NCERT History book in simple language. Use bullet points and avoid long paragraphs. Mention key dates and people. Add 2-3 FAQs with answers."
```

## 🧾 AI Output (Optional)
Include the AI’s response (especially if it was good and reused)

## 🛠️ Edits / Notes (Optional)
Mention if you edited or fixed anything manually. Write like:
- Fixed historical date
- Added missing FAQ
- Removed extra paragraph
```

---

## ✅ Prompt Writing Tips

| 👍 Do This                          | 🚫 Avoid This                      |
| ---------------------------------- | ---------------------------------- |
| 🎯 Be specific with instructions   | ❌ Giving vague commands          |
| ✂️ Use short and clear sentences  | 🌀 Long, rambling questions        |
| 📝 Ask for bullet points           | 📜 Asking for large paragraphs     |
| 🧪 Test and tweak prompts          | ⛔ Blindly copying without testing |

---

## 🚀 Examples of Good Prompts

### 🔍 Chapter Summary Prompt
```
"Summarize Chapter 2 from Class X Science NCERT (Chemistry) in 10 bullet points. Keep it simple."
```

### ❓ FAQ Generation Prompt
```
"Create 5 FAQs with answers for Chapter 3 of Class X Political Science. Each question should be based on NCERT content."
```

### 📅 Important Dates Prompt (History)
```
"List 5 important historical events from Chapter 1 of Class X History with their dates and a short explanation."
```

---

## 📌 Contribution Guidelines for PROMPTS/

- 🆕 Create a new `.md` file under the relevant subject
- ✍️ Add prompt, objective, and any AI output if available
- 📘 Keep filenames clear (e.g., `CHAPTER-1.md`)
- ✅ Use proper Markdown formatting

> 🧠 **Tip:** Start with small edits or copy an existing prompt file as a template.

---

## 🙌 Thanks for Helping!

Good prompts make good notes. Your contribution improves education for thousands of students using NoteBook-X every day 💙

Have questions? Ask in the Issues tab or check out `BEGINNERS.md` to get started!
[BEGINNERS.md](https://github.com/ubsr-official/notebooks/blob/main/BEGINNERS.md)

