"""Settings for the pandas module"""

import re

try:
    import pandas as pd

    pd.options.display.max_colwidth = 100

    class Table:
        """Table class for depicting HTML and LaTeX"""
        def __init__(self, df: pd.DataFrame, title: str, label: str) -> None:
            self.df: pd.DataFrame = df
            self.title: str = title
            self.label: str = label


        def _repr_html_(self) -> str:
            """Represent a table as HTML"""
            return self.df._repr_html_()


        def _repr_latex_(self) -> str:
            """Represent a table as LaTeX"""
            def escape_hyphen(text: str) -> str:
                """Escape hyphens ('--' -> '-{}-')"""
                return re.sub(r'-\{\}(([^\-])|$)', r'-\1', text.replace('-', '-{}'))

            # Use the typewriter font with bold
            return '\n'.join((
                r'\begin{table}[H]',
                r'  \centering',
                fr'  \caption{{{self.title}}}\label{{tab:{self.label}}}',
                r'  \begin{adjustbox}{max width=\textwidth}',
                r'    \begin{ttfamily}\begin{bfseries}{'
                f'{escape_hyphen(self.df.to_latex())}'
                r'}\end{bfseries}\end{ttfamily}',
                r'  \end{adjustbox}',
                r'\end{table}',
            ))


    def display_table(df: pd.DataFrame, title: str, label: str) -> Table:
        """Display a table with pandas.DataFrame.
        :param df:
            A DataFrame
        :type df:
            pandas.DataFrame
        :param title:
            The caption of the DataFrame
        :param title:
            str
        :param label:
            The label of the DataFrame
        :param label:
            str
        """
        return Table(df, title, label)
except ImportError:
    pass
