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

[Only one blank line](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/position_lock.gd#L3) - Only one blank line after class definition instead of two. 

[No trailing zero](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/position_lock.gd#L29) - Trailing zero not used for 4 float variables inside draw logic function.

[Line too long](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/horizontal_autoscroll.gd#L29) - Lines of code for calculating difference between vessel edge and box edge are too long. Should be formatted for better readability. 

[Only one blank line](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/lerp_smoothing.gd#L3) - Only one blank line between functions instead of two. 

[No trailing zero](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/lerp_smoothing.gd#L4) - No trailing zero for 4 export variables of type float. 

[Only one blank line](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L15) - Only one blank line between functions instead of two.

[No trailing zero](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L4) - No trailing zero for float variables. 

[Lines too long](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L27) - Should format code for calculating input direction for better readability.

#### Style Guide Exemplars ####

[Proper indentation](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L36) - Proper indentation always used, especially in code that involves many nested if statements. Example from target focus included.

[Correct amount of whitespace](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L44) - Whitespace around operators and commas always used, makes code very readable. Example from target focus included.

[Class names](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L1) - Class names are always written in camelcase as they should be.

[Variable/function names](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L5) - Variable and function names are always snake case.

[Code order](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L1) - Code always ordered correctly, with class name first, then export variables, then regular variables, then functions. 

___
#### Put style guide infractures ####

___

# Best Practices #

### Description ###

If the student has followed best practices then feel free to point at these code segments as examplars. 

If the student has breached the best practices and has done something that should be noted, please add the infraction.


This should be similar to the Code Style justification.

#### Best Practices Infractions ####

[Box width/height variables in autoscroll](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/horizontal_autoscroll.gd#L5) - Variables for box width and height are calculated using top left and bottom right variables. First, as width and height are export variables, they should not have their value calculated directly in the code and should instead be assigned via inspector. Second, they use top left and bottom right even though these are declared after width and height.

[Initialized variables not used](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/horizontal_autoscroll.gd#L29) - In autoscroll, the WIDTH and HEIGHT properties are used instead of the two variables for width and height that are declared in this class. Should not create variables if they are not going to be used.

[Delta not used](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/horizontal_autoscroll.gd#L46) - To make camera scroll, autoscroll speed is added to the camera position. However, this is a speed vector and not a distance vector. Should be multiplying speed by delta to obtain a distance the camera should have moved since the last time process was called.

[Export variables](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/lerp_smoothing.gd#L4) - Export variables assigned a value in the code instead of being controlled through inspector.

[Export variables](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L4) - Export variables assigned a value in the code instead of being controlled through inspector.

[Repeated code](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L43) - The code for making the camera catch up in target focus is repeated twice, once in the else statement and once outside. They seem to serve the same purpose, so only one is needed. 

[If statement](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L49) - Vessel.HYPER_SPEED is used as the condition for the if statement. However, this is an integer value, and not a boolean. As such, this if statement will be executed every single time since Vessel.HYPER_SPEED will always exist. 

[Unnecessary variable](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L31) - Variable is_moving is updated based on whether or not vessel is stopped. However, there doesn't seem to be a reason to keep track of this, and the variable is not used anywhere outside of this context. 

[Potential place for a bug](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L30) - Comparing a vector of float values directly to the 3d zero vector may result in an error. Because float values are not exact, the vessel may still have a nonzero direction vector despite being stopped. 

[Potential place for a bug](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L46) - Since the camera and the vessel are not located in the same y plane, using distance_to to calculate how far apart they are is dangerous. This may result in cases where distance_to returns a value that is not equal to leash distance even when within the x-z dimension the camera is at leash distance from the vessel. 

[Changing export variable](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L50) - Lead speed is an export variable that controls how much the camera should be ahead of the vessel. This should always be constant and never change. Resetting the value of an export variable within the code may lead to bugs. 

[Line outside of if statements](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L55) - This line is outside of all if statements, so it will be executed regardless of if the vessel is stopped or not. Additionally, there are already existing lerp statements within the if statements so this line is unnecessary.

[Variable never used](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L48) - Vector variable for direction to vessel is created, but is never used after its creation.

[Export variables](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/speedup.gd#L5) - Value of export variables set directly in code.

[Variable not used](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/speedup.gd#L25) - Variables for width and height created, but properties WIDTH and HEIGHT used instead.

[If statement](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/speedup.gd#L41) - Target reference variable used as an if statement condition, despite not being a boolean. This will cause this statement to always execute no matter what.

[Unused variables](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/speedup.gd#L42) - 6 new variables are created within this if statement, none of them are used. Additionally, none of them are related to the speedup zone, which is what this part of the code should be responsible for.

#### Best Practices Exemplars ####

[Very succinct implementation](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/position_lock.gd#L16) - Implementation of stage 1 accomplished in one line, without creating unnecessary variables.

[Good variable names](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/horizontal_autoscroll.gd#L29) - Variable names are very descriptive. Makes it so you always know what an if statement is doing. Especially important for stage 2, since it involves so many parts.

[Good solution](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/target_focus.gd#L27) - Good use of get action strength to determine vessel direction.

[Well formatted solution](https://github.com/ensemble-ai/exercise-2-camera-control-ktjli/blob/c5a05812accebb6fea2f1b6c7ea776d9ddb5978d/Obscura/scripts/camera_controllers/speedup.gd#L25) - Like how the code is formatted into four blocks, one for each edge. This makes the solution very easy to read and understand.
