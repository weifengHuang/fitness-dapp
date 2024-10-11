import { HardhatRuntimeEnvironment } from "hardhat/types";

module.exports = async (hre: HardhatRuntimeEnvironment) => {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;
  await deploy("TuaToken", {
    from: deployer,
    args: [], // 如果构造函数有参数，在这里添加
    log: true,
  });
};

module.exports.tags = ["TuaToken"];
