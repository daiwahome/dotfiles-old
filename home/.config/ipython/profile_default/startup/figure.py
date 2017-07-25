"""Settings for depicting LaTex figures"""

class Figure:
    """Figure class for depicting HTML and LaTeX"""
    def __init__(self, path: str, title: str, label: str) -> None:
        self.path: str = path
        self.title: str = title
        self.label: str = label

    def _repr_html_(self) -> str:
        return f'<img src="{self.path}" height="264" width="391" />'

    def _repr_latex_(self) -> str:
        return '\n'.join((
            r'\begin{figure}[H]',
            r'  \centering',
            r'  \adjustimage{max size={0.9\linewidth}{0.9\paperheight}}'
            f'{{{self.path}}}',
            fr'  \caption{{{self.title}}}\label{{fig:{self.label}}}',
            r'\end{figure}',
        ))


def display_figure(path: str, title: str, label: str) -> Figure:
    """Display a figure.
    :param path:
        The path to an image
    :type path:
        str
    :param title:
        The caption of the figure
    :param title:
        str
    :param label:
        The label of the label
    :param label:
        str
    """
    return Figure(path, title, label)
