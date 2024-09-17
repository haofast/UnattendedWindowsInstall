# Unattended Windows Install

## Overview
An [Answer (unattend.xml) file](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs?view=windows-11) can be used to modify windows installation behavior by modifying settings and features before the user lands in the desktop.

This project provides pre-made scripts that allow you to create an unattended.xml file. The scripts are tuned towards my personal preferences, but can be modified to fit yours.

The ambition for this project is to create an automated method for customizing, templatizing, and expediting my windows installations so that I don't have to do so manually.

> [!NOTE]
> Currently, the scripts included in this tool cater towards customizing Windows 11. They will work if used on Windows 10, but note that some interface customizations in the scripts will not apply to Windows 10.

## Building the Answer File
In order to build the answer file, all you need to do is execite the `build-xml.ps1` powershell script inside the root directory of the project. The answer file will then appear in the same directory as `autounattend.xml`.

Once the answer file has been built, you may copy it into the root directory of your Windows installation media to add the customizations into the install process.

> [!IMPORTANT]
> Do not rename the answer file. The answer file must be kept as `autounattend.xml` in order for the Windows installation to detect it.
