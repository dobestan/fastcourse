import os

from django.conf import settings
from django.core.management.base import BaseCommand
from django.db import connection

import pandas as pd


class Command(BaseCommand):
    help = "Export data in the database to csv format."

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):

        # Automate exporting CSV format data from database.
        # Output files ( *.csv ) will be used in lecture practice.

        inputs = [
            {
                'query': "SELECT * FROM users_user",
                'output_filename': 'users',
            },
            {
                'query': "SELECT * FROM courses_type",
                'output_filename': 'types',
            },
            {
                'query': "SELECT * FROM courses_course",
                'output_filename': 'courses',
            },
            {
                'query': "SELECT * FROM courses_enrollment",
                'output_filename': 'enrollments',
            },
        ]

        for input in inputs:
            query = input.get('query')
            output_filename = input.get('output_filename')

            self.stdout.write('Executing SQL Query "{query}"'.format(
                query=query,
            ))

            df = pd.read_sql_query(query, connection)

            # DataFrame to CSV.
            df.to_csv(os.path.join(
                'data',
                'csv',
                '{output_filename}.csv'.format(output_filename=output_filename)),
            )

            # DataFrame to Excel Format.
            df.to_excel(os.path.join(
                'data',
                'excel',
                '{output_filename}.xlsx'.format(output_filename=output_filename)),
            )
