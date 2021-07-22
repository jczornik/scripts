import sys
import getopt
import requests
import json
import html

GITHUB_URL = 'https://api.github.com'

GETTING_PARAMS_ERR = 255
MISSING_PARAMS_ERR = 254
SUCCESS_END = 0


def get_repo_url(owner, repo):
    return f'{GITHUB_URL}/repos/{owner}/{repo}'


def get_open_issues(owner, repo):
    payload = {'state': 'open'}
    repo_url = get_repo_url(owner, repo) + "/issues"
    return json.loads(requests.get(repo_url, data=payload).content)


def format_issue_as_html_link(issue):
    url = issue['url']
    title = html.escape(issue['title'])
    return f'<a href="{url}">{title}</a><br />'


def print_help():
    print("""Syntax is:
    main.py -u <user> - r <repo>
    """)


def parse_input_parameters(argv):
    user = ''
    repo = ''

    try:
        opts, args = getopt.getopt(argv, 'hu:r:', ['user=', 'repo='])
    except getopt.GetoptError:
        print_help()
        sys.exit(GETTING_PARAMS_ERR)

    for opt, arg in opts:
        if opt in ('-u', '--user'):
            user = arg
        elif opt in ('-r', '--repo'):
            repo = arg
        elif opt == "-h":
            print_help()
            sys.exit(SUCCESS_END)

    if not len(user) or not len(repo):
        print_help()
        sys.exit(MISSING_PARAMS_ERR)

    return user, repo


def main(argv):
    user, repo = parse_input_parameters(argv)
    issues = get_open_issues(user, repo)

    for issue in issues:
        print(format_issue_as_html_link(issue))


if __name__ == '__main__':
    main(sys.argv[1:])
