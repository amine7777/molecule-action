# Container image that runs your code
FROM amine7777/molecule:3.0.8

CMD cd ${INPUT_WORKING_DIR}; ${INPUT_COMMAND}