// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your Javascript code.
const uri = 'Volunteers';
let infos = [];

function getInfos() {
  fetch(uri)
    .then(response => response.json())
    .then(data => _displayInfos(data))
    .catch(error => console.error('Unable to get infos.', error));
}

function addInfo() {
  const addNicknameTextbox = document.getElementById('add-nickname');

  const info = {
    isComplete: false,
    name: addNicknameTextbox.value.trim()
  };

  fetch(uri, {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(info)
  })
    .then(response => response.json())
    .then(() => {
      getInfos();
      addNicknameTextbox.value = '';
    })
    .catch(error => console.error('Unable to add info.', error));
}

function deleteInfo(id) {
  fetch(`${uri}/${id}`, {
    method: 'DELETE'
  })
  .then(() => getInfos())
  .catch(error => console.error('Unable to delete info.', error));
}

function displayEditForm(id) {
  const info = infos.find(info => info.id === id);
  
  document.getElementById('edit-nickname').value = info.name;
  document.getElementById('edit-id').value = info.id;
  document.getElementById('edit-isComplete').checked = info.isComplete;
  document.getElementById('editForm').style.display = 'block';
}

function updateInfo() {
  const infoId = document.getElementById('edit-id').value;
  const info = {
    id: parseInt(infoId, 10),
    isComplete: document.getElementById('edit-isComplete').checked,
    nickname: document.getElementById('edit-nickname').value.trim()
  };

  fetch(`${uri}/${infoId}`, {
    method: 'PUT',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(info)
  })
  .then(() => getInfos())
  .catch(error => console.error('Unable to update info.', error));

  closeInput();

  return false;
}

function closeInput() {
  document.getElementById('editForm').style.display = 'none';
}

function _displayCount(infoCount) {
  const nickname = (infoCount === 1) ? 'info' : 'infos';

  document.getElementById('counter').innerText = `${infoCount} ${nickname}`;
}

function _displayInfos(data) {
  const tBody = document.getElementById('infos');
  tBody.innerHTML = '';

  _displayCount(data.length);

  const button = document.createElement('button');

  data.forEach(info => {
    let isCompleteCheckbox = document.createElement('input');
    isCompleteCheckbox.type = 'checkbox';
    isCompleteCheckbox.disabled = true;
    isCompleteCheckbox.checked = info.isComplete;

    let editButton = button.cloneNode(false);
    editButton.innerText = 'Edit';
    editButton.setAttribute('onclick', `displayEditForm(${info.id})`);

    let deleteButton = button.cloneNode(false);
    deleteButton.innerText = 'Delete';
    deleteButton.setAttribute('onclick', `deleteInfo(${info.id})`);

    let tr = tBody.insertRow();
    
    let td1 = tr.insertCell(0);
    td1.appendChild(isCompleteCheckbox);

    let td2 = tr.insertCell(1);
    let textNode = document.createTextNode(info.name);
    td2.appendChild(textNode);

    let td3 = tr.insertCell(2);
    td3.appendChild(editButton);

    let td4 = tr.insertCell(3);
    td4.appendChild(deleteButton);
  });

  infos = data;
}
