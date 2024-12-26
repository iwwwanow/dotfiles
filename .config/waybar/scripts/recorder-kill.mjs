#!/usr/bin/env node

import { exec } from "node:child_process";

const main = async () => {
  exec("pkill wf-recorder");
};

main();
