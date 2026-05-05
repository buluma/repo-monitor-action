import { readFileSync } from "fs";

const readCssFromPackage = (id: string): string =>
  readFileSync(require.resolve(id), "utf8");

export const importCss = () => `${readCssFromPackage("tailwindcss/index.css")}
${readCssFromPackage("react-vis/dist/style.css")}`;
