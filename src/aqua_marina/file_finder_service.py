"""File finder service.

It is constructed like this so that it can be easily tested.
"""

from os import path
from typing import Any


class FileFinderService:
    """Find a file upwards from a starting directory."""

    def __init__(self, isfile=path.isfile, abspath=path.abspath):
        """Initialise the file finder service, so items can be mocked for testing."""
        self.isfile = isfile  # so we can confirm if a file exists.
        self.abspath = (
            abspath  # so we can get the complete path to where we are to begin with.
        )

    def find_file_upwards(self, filename: str, start_directory: str = ".") -> Any:
        """Find a file upwards from a starting directory."""
        current_directory = self.abspath(start_directory)
        while (
            True
        ):  # keep looping until we find the file or reach the root of the filesystem.
            potential_path = path.join(current_directory, filename)
            if self.isfile(potential_path):  # you found the file.
                return potential_path
            parent_directory = path.dirname(current_directory)  # move up a directory.
            if current_directory == parent_directory:
                return None  # you reached the root of the filesystem without finding.
            current_directory = parent_directory  # move up a directory and try again.
