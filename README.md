# SQL Workshop 2026 - Instructor Materials

This folder contains all the necessary files, datasets, and instructional materials to deliver the SQL Workshop at the BMO Finance Research and Trading Lab.

We use DBeaver as the primary teaching software for this session.

    INSTRUCTOR NOTE: Managing the Software Launch
    When students open DBeaver for the first time, they must not click ahead or proceed with any default actions. Instruct the room to wait, and guide them to explicitly click through the following sequence to load the environment properly:

    Confirm ➔ Yes ➔ Download (the DBeaver Sample Database)

Directory Contents
1. Datasets (/Archive): The Archive folder contains the exact same data files that are stored locally on the shared (Q:) drive on the lab computers. This data is based on the Kaggle Financial Transactions Fraud dataset.

    - users_data.csv: The client demographic profile (Parent Table).
    - cards_data.csv: The financial products/credit cards issued (Parent Table).
    - transactions_data.csv: The action ledger containing over 13 million rows of swipe data (Child/Fact Table).
    Note: The Primary Key and Foreign Key relationships connecting these three tables are fully detailed in the Speaker Notes, but they were not pre-configured on the datasets as they were download from Kaggle.

2. Presentation Slides
    SQL Workshop 2026.pptx: This slide deck is strictly for the introductory portion of the workshop. It covers the database architecture, table relationships, and the "why" behind using SQL over Excel before transitioning into the hands-on coding portion.

3. Instructor Guide
    SQL_Workshop_Speaker_Notes.pdf: The master instructional guide. Instructors should follow this document step-by-step to hold the session. It contains the exact cadence, teaching tips, and all the SQL example code (from basic SELECT statements to complex JOINs and CASE statements) needed for the live demonstration.

4. Student Takeaways
    SQL_Workshop_Student_version.pdf: A streamlined handout for the participants. Students can scan the QR code provided in this document to take away all the SQL code snippets and reference materials used during the workshop for their own future review.


---

## 📜 Acknowledgements

Developed as part of the **Rotman International Trading Competition (RITC)** and **Rotman Finance Group Finance Research & Trading Lab** educational ecosystem.

**Copyright © Rotman BMO Finance Group Finance Research & Trading Lab, University of Toronto.**
All rights reserved.

---

## 🧩 Author

**Yi-Ming Chang**
Educational Developer, Rotman Finance Research & Trading Lab
University of Toronto
