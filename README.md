# Lab #3 Assignment

## Objective

The first two labs covered a wide array of topics to get everyone up to speed with the FPGA development environment and basic HDL constructs.  The remaining labs will more narrowly focus on particular FPGA design concepts.  

One of these concepts is code reutilization, which isn't limited to FPGA design but, when done properly, can greatly enhance an FPGA designers productivity.  This lab reutilizes code from Lab 2 to introduce the concepts of reusing and refactoring code modules to improve work efficiency and code reliability.

The lab demonstrates mechanisms to deal with asynchronous input signals (from the slide switches and push buttons) to mitigate metastability issues.  Following proper correct clock domain synchronization and debouncing techniques improves a design's reliability.  Some basic synchronization structures are introduced in this lab while more advanced structures will be covered in later labs.

The use of _parameters_ to simplify design changes was introduced in the previous lab.  This will be further expanded upon using _generate_ blocks to automatically instantiate logic based on _parameter_ inputs.  Using generation, a designer can algorithmically construct complex structures using succinct code blocks.  

Finally, the lab expands on the HDL components used in the previous lab, as well as adding a new component, the Shift Register.  These components are the basic building blocks of FPGA design and will be used in many of the future labs.


## Assignment Overview

* Retrieve the Lab Assignment from GitHub
* Create the Quartus Project
* Follow the [**Lab 3 Project** Guide](Lab3-Guide/Lab3-ProjectGuide.md)
* [Lab Report Write-up](#lab-report-requirements)
* Commit, tag, and push all modified lab files to **GitHub** following the [**Submission Guide**](Lab3-Guide/GitHub-SubmissionGuide.md)
* Submit report PDF to **Canvas**

## Assignment Details

1. Retrieve the **Lab 3 Assignment** repository from GitHub.

	An e-mail with the **Lab 3 Assignment Invitation Link** should have been received, if not, contact an instructor.  Opening the Invitation Link and accepting the assignment will create a new private GitHub repository labeled with your GitHub username (_**lab3-assignment-username**_).

	* The Lab 3 Assignment repository can be found here: [GitHub EECS301](https://github.com/CWRU-EECS301-S18)
	* Clone the _**lab3-assignment-username**_ repository to your development machine using the same procedures outlined in the **Lab 1 Git Tutorial**.

1. Create the Quartus Project for the lab assignment following the same _New Project Wizard_ procedure used the previous labs with the parameters listed below.

	**NOTE:** No guide is provided this time so refer back to the previous lab if you don't have the project creation steps down yet.

	* Set the project working directory to the `Lab3-Project` directory of the Lab Assignment Repository.
	* Name the project: `EECS301_Lab3_Project`
	* Name the top level design entity: `EECS301_Lab3_TopLevel`
	* Add the following Framework files to the project:

		```
		CDC_Input_Synchronizer.v
		CLS_LED_Output_Fader.v
		CLS_Scanner_Module.v
		EECS301_Lab3_TopLevel.v
		Key_Synchronizer_Module.v
		LED_Segment_Mapper.v
		Switch_Debounce_Synchronizer.v
		StdFunctions.vh
		EECS301_Lab3_Project.sdc
		TF_CLS_LED_Output_Fader.v  (Verilog Test Bench)
		TF_EECS301_Lab3_TopLevel.v  (Verilog Test Bench)
		```
	
	* Remember to set the file type to **Verilog Test Bench** for the Test Bench files.
	* Import the Pin Assignment file: `Lab3_Project_Assignments.qsf`
	* Refer back to the previous lab's Quartus Guides for help on any of the steps.

1. The [**Lab 3 Project Guide**](Lab3-Guide/Lab3-ProjectGuide.md) provides the main implementation details for the lab assignment.

1. Write the lab report following the [**Lab Report Requirements**](#lab-report-requirements) detailed in the next section.

1. Submit the assignment (including all code, project files, and lab report) back to GitHub following the [**Lab Assignment Submission Guide**](Lab3-Guide/GitHub-SubmissionGuide.md).

1. Submit the lab report in PDF format to **Canvas**.

	
## Lab Report Requirements

Include the following in the lab report:

* The **Introduction** section should give a brief description of the overall functionality of the project and the new concepts learned about in the lab.

* The **Implementation Details** section should include a functional description for the _CLS\_LED\_Output\_Fader_, _CLS\_Scanner\_Module_, and _Key\_Synchronizer\_Module_ modules and what new techniques were learned from the modules.  If problems occurred while refactoring the other modules from Lab 2 include details of the issues.

* The **Verification Results** section should include the waveform captures from the two simulations included with the lab.  If the first run of the simulation had problems, mention what the problems were and your debugging steps to solve the problem.

* The **Conclusions** section should summarize what was learned from the implementation and verification tasks.

* In the remaining sections provide an estimate of the time spent doing the lab and any issues or difficulties encountered.

## Lab Due Date

The lab project and report will be due by 3:00pm on **Feb 9, 2018**.

All files and code must be committed and pushed to GitHub by the submission deadline.  The submission process is detailed in the [**Lab Submission Guide**](Lab3-Guide/GitHub-SubmissionGuide.md).

The PDF version of the lab report also needs to be submitted to Canvas by the same submission deadline.


## Grading Rubric

**Lab 3 is worth 290 points total:**

 *   10 points for a correct refactoring of CLS\_PWM\_Interval\_Timer
 *   10 points for a correct refactoring of CLS\_PWM\_DutyCycle\_Timer
 *   20 points for a correct refactoring of CLS\_Fadeout\_Timer
 *   50 points for a correct instantiation of CLS\_LED\_Output\_Fader
 *   100 points for a correct instantiation of CLS\_Scanner\_Module
 *   10 points for the simulation screenshot of the CLS\_Scanner\_Module operation
 *   30 points for a correct instantiation of Key\_Synchronizer\_Module
 *   20 points for the simulation screenshot of the EECS301\_Lab3\_TopLevel operation
 *   10 points for a correct verification of the operation of the LED's by a TA.
 *   20 points for the content of the lab report
 *   5 points for the completed lab report submitted in Markdown format to GitHub repo
 *   5 points for the completed lab report in PDF format submitted to Canvas
