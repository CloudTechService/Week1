# System Maintenance Scripts

This repository contains a collection of Bash scripts designed to assist with routine system maintenance tasks. These scripts automate monitoring and housekeeping operations, helping administrators manage resources effectively.

## Scripts Overview

### 1. **`activeusers.sh`**
   - **Description**: Generates a report of currently active users on the system.
   - **How it works**:
     - Uses the `who` command to list active users.
     - Filters and formats the output to include unique usernames.
     - Saves the report to `/home/vagrant/active_users.txt` with a timestamp.
   - **Usage**:
     ```bash
     ./activeusers.sh
     ```
   - **Output**: Displays the report on the console and saves it to the specified file.

### 2. **`freememalert.sh`**
   - **Description**: Monitors free memory and sends an email alert if it drops below 50%.
   - **How it works**:
     - Retrieves total and free memory using the `free` command.
     - Calculates free memory percentage.
     - Logs the memory status to `/var/log/cronlogs/freememoryalert.log` (keeps the last 5 entries).
     - Sends an email alert if free memory is less than 50%.
   - **Usage**:
     ```bash
     ./freememalert.sh
     ```
   - **Requirements**:
     - `mail` utility must be configured for email alerts.
   - **Customization**:
     - Update the `recipient` variable with the desired email address.

### 3. **`removeoldlogs.sh`**
   - **Description**: Removes log files older than 7 days from the `/var/log/` directory.
   - **How it works**:
     - Searches for `.log` and `.log.*` files older than 7 days.
     - Deletes the identified files.
     - Prints a message indicating the status of the operation.
   - **Usage**:
     ```bash
     ./removeoldlogs.sh
     ```
   - **Output**: Provides feedback on the number of old logs removed or if no logs were found.

## Setup and Permissions

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Make the scripts executable:
   ```bash
   chmod +x activeusers.sh freememalert.sh removeoldlogs.sh
   ```

3. Run the scripts as needed.

## Scheduling with Cron
To automate these tasks, you can set up cron jobs:

1. Edit the crontab:
   ```bash
   crontab -e
   ```

2. Add entries for the scripts. Example:
   ```cron
   # Run activeusers.sh every hour
   0 * * * * /path/to/activeusers.sh

   # Run freememalert.sh every 5 minutes
   */5 * * * * /path/to/freememalert.sh

   # Run removeoldlogs.sh daily at midnight
   0 0 * * * /path/to/removeoldlogs.sh
   ```

## Contributions
Feel free to submit issues or pull requests if you have suggestions or improvements.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---

Happy scripting! :gear:
