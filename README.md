# TestRail CLI results upload action

 > [GitHub Action](https://docs.github.com/en/actions) to upload automated test results to [TestRail](https://www.testrail.com) using the [TestRail CLI](https://github.com/gurock/trcli). The action handles the installation of the desired CLI version and allows setting all of the configurations supported by the CLI.

 # Usage example

```yml
- name: Execute TRCLI Action
    uses: d-rede/trcli-action@main
    with:
        host: 'https://my-instance.testrail.io/'
        username: 'username@testrail.com'
        password: 'myPassword123'
        project: 'Sample project'
        auto_create_cases_yes: 'true'
        report_file_path: 'reports/junit-report.xml'
        title: 'Automated test run'
        run_description: 'GitHub workflow: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}'
```

# Available parameters

| Parameter               | Description     |
|-------------------------|-----------------|
| `trcli_version`         | Version of the CLI to be installed (defaults to latest) |
| `working_directory`     | The working directory to execute the TestRail CLI |
| `config`                | Optional path for config yml file |
| `host`                  | TestRail host URL (i.e.: https://my-instance.testrail.io) |
| `username`              | Authentication username |
| `password`              | Authentication password or API key |
| `project`               | Name of the project (alternatively, use the "project_id" parameter) |
| `project_id`            | ID of the project (alternatively, use the "project" parameter) |
| `verbose`               | Output all API calls and their results (default: false) |
| `verify`                | Verify the data was added correctly (default: false) |
| `insecure`              | Allow insecure requests (default: false) |
| `batch_size`            | Configurable batch size (default: 50) |
| `timeout`               | Batch timeout duration (default: 30) |
| `auto_create_cases_yes` | Automatically create unexisting test cases (true/false) |
| `auto_create_cases_no`  | Skip creation of unexisting test cases (true/false) |
| `silent`                | Silence output (default: false) |
| `report_file_path`      | Path to the JUnit XML file |
| `title`                 | Title of Test Run to be created in TestRail |
| `case_matcher`          | Mechanism to match cases between the JUnit report and TestRail (auto/name/property, default: auto) |
| `close_run`             | Close the newly created run (default: false) |
| `suite_id`              | Suite ID where the run will be created in case of a multi-suite project |
| `run_id`                | Run ID to submit results to (by default a new Test Run is created) |
| `milestone_id`          | Milestone ID to which the Test Run should be associated to |
| `run_description`       | Summary text to be added to the test run |
| `special_parser`        | Optional special parser option for specialized JUnit reports |
| `allow_ms`              | Enable milliseconds for elapsed times (default: false) |
| `junit_parser_params`   | Any parameters, as you would write them on a command line (i.e.: --case-fields type_id:1) |

