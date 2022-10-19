*** Settings ***
Library    OperatingSystem

*** Variables ***
${output_directory}     Outputs
${directory_1}          first directory
${directory_2}          second directory
${file_1}               firs file.txt
${file_2}               second file.txt
${file_3}               third file.txt
*** Keywords ***
Create the Base Directory
    create directory    ${output_directory}
    should exist        ${output_directory}

Create Directory 1
    ${directory_path} =    join path    ${output_directory}     ${directory_1}
    create directory    ${directory_path}
    should exist    ${directory_path}

Create Directory 2
    ${directory_path} =    join path    ${output_directory}     ${directory_2}
    create directory    ${directory_path}
    should exist    ${directory_path}

Create the First File
    ${file_path} =    join path    ${output_directory}      ${directory_1}    ${file_1}
    create file    ${file_path}     This is text in file 1
    should exist   ${file_path}

Create the Second File
    ${file_path} =    join path    ${output_directory}      ${directory_2}    ${file_2}
    create file    ${file_path}     This is text in file 2
    should exist   ${file_path}

Move File 1 from Durectory 1 to Directory 2
    ${source_path} =  join path    ${output_directory}      ${directory_1}    ${file_1}
    ${target_path} =  join path    ${output_directory}      ${directory_2}    ${file_1}

    move file    ${source_path}    ${target_path}
    should exist    ${target_path}
    should not exist    ${source_path}