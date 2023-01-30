import { BarretenbergWasm } from "@noir-lang/barretenberg/dest/wasm/index";
import { SinglePedersen } from "@noir-lang/barretenberg/dest/crypto/pedersen";

export async function pedersen() {
  const barretenberg = await BarretenbergWasm.new();
  const pederson = new SinglePedersen(barretenberg);

  const preImageBuffer = Buffer.alloc(32);
  preImageBuffer.write("42", "utf-8");

  const publicHashed = pederson.compressInputs([preImageBuffer]);
  const preImageBufferStr = `0x${preImageBuffer.toString("hex")}`;
  console.log("Salt:", preImageBufferStr);
  const publicHashedStr = `0x${publicHashed.toString("hex")}`;
  console.log("Hash:", publicHashedStr);
}

pedersen();
