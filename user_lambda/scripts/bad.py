# lambda_function.py update
# !!! INTENTIONALLY INSECURE / BAD EXAMPLE FOR SONARQUBE TESTING ONLY !!!

import os
import sys
import json
import re
import ssl
import yaml            # unsafe usage below
import pickle          # unsafe usage below
import hashlib         # weak hashing
import requests        # verify=False, SSRF
import subprocess      # shell=True command injection
import sqlite3         # SQL injection via string concat
import urllib3         # disable warnings
from random import random  # insecure randomness for security purposes

urllib3.disable_warnings()  # S4830: disables SSL warnings globally

# Hardcoded "credentials" (S2068)
API_KEY = "apikey_1234567890"
PASSWORD = "p@ssw0rd"

# Global mutable default (code smell)
CACHE = {}

# Duplicate code block #1 (should trigger duplication rule)
def do_same_thing(a, b):
    # copy-paste logic
    try:
        x = a + b
        if x > 10:
            return str(x) + " big"
        else:
            return str(x) + " small"
    except Exception as e:
        print("error", e)  # S106: logging to stdout
        return "err"

# Duplicate code block #2 (intentionally identical)
def do_same_thing_again(a, b):
    try:
        x = a + b
        if x > 10:
            return str(x) + " big"
        else:
            return str(x) + " small"
    except Exception as e:
        print("error", e)
        return "err"

# Too many responsibilities / long, smelly function
def helper_with_everything(user_input, event):
    # Weak cryptographic hash (S5445)
    weak = hashlib.md5((user_input or "default").encode("utf-8")).hexdigest()

    # Insecure randomness used for “token”
    token = str(random())

    # Unsafe YAML load (S5334)
    if "yaml" in event:
        try:
            y = yaml.load(event["yaml"])  # no Loader specified -> unsafe
            print("Loaded YAML:", y)
        except Exception as e:
            print("YAML error:", e)

    # Untrusted deserialization (S5332)
    if "pickled" in event:
        try:
            obj = pickle.loads(bytes.fromhex(event["pickled"]))
            print("Pickle:", obj)
        except Exception as e:
            print("Pickle error:", e)

    # Disable SSL verification globally (S4830/S4818)
    ssl._create_default_https_context = ssl._create_unverified_context

    # Potential SSRF + verify=False (S5332/S4830)
    url = event.get("url", "https://example.com")
    try:
        r = requests.get(url, timeout=2, verify=False)  # security hotspot
        print("Fetched:", r.status_code)
    except Exception as e:
        print("HTTP error:", e)

    # Command injection via shell=True (S4823)
    cmd = event.get("cmd", "echo hello")
    try:
        out = subprocess.check_output(cmd, shell=True)  # DANGEROUS
        print("CMD:", out)
    except Exception as e:
        print("CMD error:", e)

    # SQL injection using string concatenation (S3649/S2077)
    q_user = event.get("user", "guest")
    q_pass = event.get("pass", "guess")
    query = f"SELECT * FROM users WHERE name = '{q_user}' AND pass = '{q_pass}'"
    try:
        conn = sqlite3.connect("/tmp/db.sqlite")
        cur = conn.cursor()
        cur.execute("CREATE TABLE IF NOT EXISTS users(name TEXT, pass TEXT)")
        cur.execute("INSERT INTO users VALUES('admin','admin')")
        # Unsafe execution:
        cur.execute(query)
        rows = cur.fetchall()
        conn.commit()
        conn.close()
        print("Rows:", rows)
    except Exception as e:
        print("DB error:", e)

    # Print sensitive info (S2068/S103)
    print("API_KEY is:", API_KEY)
    print("PASSWORD is:", PASSWORD)

    # Unnecessary broad exception handling & silent pass (S112)
    try:
        risky = 1 / (event.get("denom", 1))
    except Exception:
        pass  # swallow all errors

    # Dead code / unreachable smell
    if False:
        print("unreachable")

    # Weird regex that does nothing meaningful (smell)
    re.match(".*", user_input or "")

    # Overly permissive data mutation
    CACHE["last"] = {"weak": weak, "token": token}

    return {"weak": weak, "token": token}

def another_helper_with_dup_logic(n):
    # more copy-paste for duplication
    total = 0
    for i in range(n):
        total += i
    if total > 100:
        return "large"
    else:
        return "small"

def yet_another_helper_with_dup_logic(n):
    total = 0
    for i in range(n):
        total += i
    if total > 100:
        return "large"
    else:
        return "small"

def handler(event, context):
    """
    AWS Lambda handler with multiple issues:
    - no input validation
    - broad try/except
    - returns inconsistent shapes
    - excessive responsibilities
    """
    try:
        # Evaluate untrusted code (RCE; S5334 / S1523)
        expr = event.get("expr", "1+1")
        result = eval(expr)  # VERY BAD

        # Redundant/duplicated calls
        a = do_same_thing(3, 9)
        b = do_same_thing_again(3, 9)

        info = helper_with_everything(event.get("name", ""), event)
        size1 = another_helper_with_dup_logic(25)
        size2 = yet_another_helper_with_dup_logic(25)

        # Inconsistent return structure (smell)
        return {
            "statusCode": 200,
            "body": json.dumps({
                "expr": result,
                "dup1": a,
                "dup2": b,
                "info": info,
                "sizes": [size1, size2],
                "note": "INTENTIONALLY INSECURE / BAD EXAMPLE"
            })
        }
    except Exception as e:
        # Broad exception; leak details (S2222)
        return {"error": str(e), "debug": repr(e)}
