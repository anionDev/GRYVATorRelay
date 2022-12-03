import sys
import os
from pathlib import Path
from ScriptCollection.GeneralUtilities import GeneralUtilities
from ScriptCollection.ScriptCollectionCore import ScriptCollectionCore
from ScriptCollection.TasksForCommonProjectStructure import TasksForCommonProjectStructure


@GeneralUtilities.check_arguments
def standardized_tasks_build_for_docker_library_project_in_common_project_structure(build_script_file: str, target_environment_type: str, verbosity: int, commandline_arguments: list[str]):
    self = TasksForCommonProjectStructure()
    use_cache: bool = target_environment_type != "Productive"
    verbosity = self.get_verbosity_from_commandline_arguments(commandline_arguments, verbosity)
    sc: ScriptCollectionCore = ScriptCollectionCore()
    codeunitname: str = Path(os.path.dirname(build_script_file)).parent.parent.name
    codeunit_folder = GeneralUtilities.resolve_relative_path("../..", str(os.path.dirname(build_script_file)))

    codeunitname_lower = codeunitname.lower()
    version = self.get_version_of_codeunit(os.path.join(codeunit_folder, f"{codeunitname}.codeunit.xml"))
    args = ["image", "build", "--pull", "--force-rm", "--progress=plain", "--build-arg", f"TargetEnvironmentType={target_environment_type}",
            "--tag", f"{codeunitname_lower}:latest", "--tag", f"{codeunitname_lower}:{version}", "--file", "Dockerfile"]
    if not use_cache:
        args.append("--no-cache")
    args.append(".")
    codeunit_content_folder = os.path.join(codeunit_folder, codeunitname)
    sc.run_program_argsasarray("docker", args, codeunit_content_folder, verbosity=verbosity, print_errors_as_information=True)
    artifacts_folder = GeneralUtilities.resolve_relative_path("Other/Artifacts", codeunit_folder)
    app_artifacts_folder = os.path.join(artifacts_folder, "BuildResult_OCIImage")
    GeneralUtilities.ensure_directory_does_not_exist(app_artifacts_folder)
    GeneralUtilities.ensure_directory_exists(app_artifacts_folder)
    sc.run_program_argsasarray("docker", ["save", "--output", f"{codeunitname}_v{version}.tar",
                                          f"{codeunitname_lower}:{version}"], app_artifacts_folder, verbosity=verbosity, print_errors_as_information=True)


def build():
    standardized_tasks_build_for_docker_library_project_in_common_project_structure(str(Path(__file__).absolute()), "QualityCheck", 1, sys.argv)


if __name__ == "__main__":
    build()
