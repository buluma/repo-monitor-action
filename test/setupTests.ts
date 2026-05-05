import "@testing-library/react";
import * as expect from "expect";

import { toMatchImageSnapshot } from "jest-image-snapshot";

expect.extend({ toMatchImageSnapshot });

if (process.env.CI) {
  // Avoid launching Chromium in CI runners for non-visual tests.
  jest.mock("jsdom-screenshot", () => ({
    generateImage: jest.fn(async () => Buffer.from("")),
  }));
}
