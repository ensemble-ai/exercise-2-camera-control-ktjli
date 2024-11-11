# Peer-Review for Programming Exercise 2 #

## Description ##

For this assignment, you will be giving feedback on the completeness of assignment two: Obscura. To do so, we will give you a rubric to provide feedback. Please give positive criticism and suggestions on how to fix segments of code.

You only need to review code modified or created by the student you are reviewing. You do not have to check the code and project files that the instructor gave out.

Abusive or hateful language or comments will not be tolerated and will result in a grade penalty or be considered a breach of the UC Davis Code of Academic Conduct.

If there are any questions at any point, please email the TA.   

## Due Date and Submission Information
See the official course schedule for due date.

A successful submission should consist of a copy of this markdown document template that is modified with your peer review. This review document should be placed into the base folder of the repo you are reviewing in the master branch. The file name should be the same as in the template: `CodeReview-Exercise2.md`. You must also include your name and email address in the `Peer-reviewer Information` section below.

If you are in a rare situation where two peer-reviewers are on a single repository, append your UC Davis user name before the extension of your review file. An example: `CodeReview-Exercise2-username.md`. Both reviewers should submit their reviews in the master branch.  

# Solution Assessment #

## Peer-reviewer Information

* *name:* Brian Li
* *email:* bryli@ucdavis.edu

### Description ###

For assessing the solution, you will be choosing ONE choice from: unsatisfactory, satisfactory, good, great, or perfect.

The break down of each of these labels for the solution assessment.

#### Perfect #### 
    Can't find any flaws with the prompt. Perfectly satisfied all stage objectives.

#### Great ####
    Minor flaws in one or two objectives. 

#### Good #####
    Major flaw and some minor flaws.

#### Satisfactory ####
    Couple of major flaws. Heading towards solution, however did not fully realize solution.

#### Unsatisfactory ####
    Partial work, not converging to a solution. Pervasive Major flaws. Objective largely unmet.


___

## Solution Assessment ##

### Stage 1 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Camera remains centered on vessel at all times regardless of vessel movement. Achieved by resetting camera position to vessel position every time process is called, a very efficient implementation. 5x5 cross is drawn correctly.

___
### Stage 2 ###

- [ ] Perfect
- [x] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Camera scrolls at a constant speed as determined by the vector autoscroll speed. Box that vessel cannot escape is correctly drawn, size calculated using the two vectors top left and bottom right. Vessel is unable to leave box, when pushed up against edge of box it stops moving. Achieved in code by moving vessel's position backwards every time it leaves the box. However, when the vessel is not moving, it still moves at the same speed/direction as the camera's autoscroll, which is not correct. The vessel should stop moving while the camera continues to move. Also, the vessel is not pushed along by the autoscroll box's left side, since it always matches the speed of the camera. 

___
### Stage 3 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Camera correctly lags behind vessel at follow speed until leash distance reached. When vessel stops, camera catches up at catchup speed. No bugs occur when vessel changes direction or switches to hyperspeed. Implementation is very efficient and straightforward, achieved using the lerp function.

___
### Stage 4 ###

- [ ] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [x] Unsatisfactory

___
#### Justification ##### 
When you try to move, the camera shoots off at a random direction that isn't the direction of vessel movement, and at such a high speed that it completely leaves the map and never makes it back to the vessel. Additionally, at first I thought that the stage 4 implementation was missing because when I toggled to this camera it was already outside of the map. I was only able to find stage 4 because I added an extra line in camera selector that would center the camera onto the vessel after you toggle. All the required export variables are present in the code, and it looks like the code was written to execute stage 4 correctly and w/o bugs. Therefore, I'm not really sure what exactly is causing this to happen. 

___
### Stage 5 ###

- [ ] Perfect
- [x] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Only the outer box is drawn for this camera, plus the speedup zone in between the inner and outer boxes is very small. As such, I at first couldn't find this camera and thought that it was another pushbox camera. However, when testing this camera, it appears that it does correctly fulfill the requirements. When the vessel is inside the inner box, the camera does not move. Once the vessel leaves the inner box for the speedup zone, the camera begins speeding up. Once the vessel makes contact with the side of the outer box, it behaves like a pushbox. In the code, all the correct export variables are present. The code resets the vessel position when it leaves the outer box so that it behaves like a pushbox. The code for the speedup zone is a bit confusing, as it involves an if statement that treats the vessel reference variable as a boolean, creates 4 new boolean variables for whether or not the vessel is touching a certain edge of the pushbox, doesn't use these four new boolean values, and then uses the lerp function combined with push ratio to move the camera. I'm not certain how this implementation works, but when testing it the camera appears to behave as intended. 
___
# Code Style #


### Description ###
Check the scripts to see if the student code adheres to the GDScript style guide.

If sections do not adhere to the style guide, please peramlink the line of code from Github and justify why the line of code has not followed the style guide.

It should look something like this:

* [description of infraction](https://github.com/dr-jam/ECS189L) - this is the justification.

Please refer to the first code review template on how to do a permalink.


#### Style Guide Infractions ####

#### Style Guide Exemplars ####

___
#### Put style guide infractures ####

___

# Best Practices #

### Description ###

If the student has followed best practices then feel free to point at these code segments as examplars. 

If the student has breached the best practices and has done something that should be noted, please add the infraction.


This should be similar to the Code Style justification.

#### Best Practices Infractions ####

#### Best Practices Exemplars ####
