# Trace #
An open source calculation toolkit for Acoustics 
### 1. Introduction ###
Trace is a custom designed Add-In for Excel to assist in the calculation of noise levels, particularly for mechanical sources. The methods used generally implement ASHRAE methodology, version 2011. 

### 2. Design Principles ###
The Add-In can be used for a variety of calculations, mainly centred around fundamental acoustic equations. Where possible, the full equation is written out, except where:

- Empirical relationships exist / lookup tables are required. 
- The formula is difficult to read as an inline function.

Other design principles of the toolkit are:
- All losses are to be inserted as negative numbers. In general the final formula should be the sum of all lines of the calculation. 
- Sheets are designed to be printable as an Appendix to a report. Not all lines of the calculation are displayed in the final presented sheet, but should be sufficient for a review. 

### 3. Installation (.xlam file) ### 
To install in Excel go to `File>Options>Add-ins.` Then click on `Go…`
Then browse to where the NoiseCalc folder has been saved, eg.
Z:\Specialists\Acoustics\1 - Technical Library\Excel Add-in\NoiseCalc
And add the file `NoiseCalc.xlam`

**Optional - Central Locations**
For business groups, the toolkit may be placed centrally on the network with all users pointing to it. If this is the case, then when prompted as follows:

`Copy Trace.xlam to the AddIns folder for USERNAME? `

Click `No`

Updates to the central AddIn file will automatically be rolled out to all users.

