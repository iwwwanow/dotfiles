#!/usr/bin/env node

import { exec } from "node:child_process";

const STDOUT_MOCK = "34139 tty1     00:00:01 wf-recorder";
const COMMON_OUTPUT_TEXT = "REC";

const main = async () => {
  const execCallback = async (_, stdout) => {
    const recordDataArray = stdout.split("\n").filter((item) => item);

    if (recordDataArray.length) {
      const recordData = recordDataArray[0];
      const recordProcessId = recordData.split(" ")[0];
      const recordCaptureTime = recordData.split(" ").filter((i) => i)[2];

      const outputText = COMMON_OUTPUT_TEXT;
      const outputAltText = `${recordProcessId} ${recordCaptureTime}`;

      const outputRecordData = {
        text: outputText,
        alt: outputAltText,
        tooltip: outputAltText,
      };
      const outputJsonData = JSON.stringify(outputRecordData);
      process.stdout.write(outputJsonData);
    } else {
      const outputRecordData = { text: "" };
      const outputJsonData = JSON.stringify(outputRecordData);
      process.stdout.write(outputJsonData);
    }
  };

  exec("ps -e|grep wf-recorder", execCallback);
};

main();
